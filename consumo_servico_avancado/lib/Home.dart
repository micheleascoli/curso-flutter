import 'package:consumo_servico_avancado/Post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:core';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _urlBase = Uri.parse("https://jsonplaceholder.typicode.com");

  Post post = Post(0, 1, "", "");

  Future<List<Post>> _recuperarPostagens() async {

    Uri url = Uri.https(_urlBase as String, '/posts');
    http.Response response = await http.get(url);
    var dadosJson = json.decode( response.body );

    List<Post> postagens = [];

    for( var post in dadosJson ){
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: FutureBuilder<List<Post>>(
        future: _recuperarPostagens(),
        builder: (context, snapshot){

          switch( snapshot.connectionState ){
            case ConnectionState.none :
            case ConnectionState.waiting :
              return  Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active :
            case ConnectionState.done :
              if( snapshot.hasError ){
                print("lista: Erro ao carregar");
              } else {
                print("lista: carregou!!");

                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index){
                      return ListTile(
                        title: Text(" teste "),
                        subtitle: Text("teste"),
                      );
                    }
                );
              }
              break;
          }
        },
      ),
    );
  }
}
