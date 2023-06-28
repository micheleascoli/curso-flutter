import 'dart:ffi';

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

  //var _urlBase = Uri.parse("https://jsonplaceholder.typicode.com");
  String _urlBase = "https://jsonplaceholder.typicode.com";

  //Post post = Post(0, 1, "", "");

  Future<List<Post>> _recuperarPostagens() async {

    http.Response response = await http.get(Uri.parse(_urlBase+"/posts"));
    var dadosJson = json.decode( response.body );

    List<Post> postagens = [];

    for( var post in dadosJson ){
      print("post: "+post["title"]);
      Post p = Post(post["userId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }
    return postagens;
  }

  _post() async {
    Post post = new Post(120, 0,"Titulo2", "Corpo da postagem2");
    var corpo = jsonEncode(
      post.toJson()
    );

    http.Response response = await http.post(Uri.parse(
        _urlBase+"/posts"),
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: corpo
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");
  }
  _put() async {
    Post post = new Post(120, 0,"Titulo2", "Corpo da postagem2");
    var corpo = jsonEncode(
        post.toJson()
    );

    http.Response response = await http.put(Uri.parse(
        _urlBase+"/posts/2"),
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: corpo
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }
  _patch() async {
    Post post = new Post(120, 0,"Titulo2", "Corpo da postagem2");
    var corpo = jsonEncode(
        post.toJson()
    );
    http.Response response = await http.patch(Uri.parse(
        _urlBase+"/posts/2"),
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        },
        body: corpo
    );
    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");

  }
  _delete() async {
    http.Response response = await http.delete(Uri.parse(
        _urlBase+"/posts/2"),
    );

    print("resposta: ${response.statusCode}");
    print("resposta: ${response.body}");


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: _post,
                    child: Text("Salvar"),
                ),
                ElevatedButton(
                  onPressed: _patch,
                  child: Text("Atualizar"),
                ),
                ElevatedButton(
                  onPressed: _delete,
                  child: Text("Remover"),
                )
              ],
            ),
            Expanded(
                child: FutureBuilder<List<Post>>(
                  future: _recuperarPostagens(),
                  builder: (context, snapshot){
                    var retorno;

                    switch( snapshot.connectionState ){
                      case ConnectionState.none :
                      case ConnectionState.waiting :
                        retorno = Center(
                          child: CircularProgressIndicator(),
                        );
                        break;
                      case ConnectionState.active :
                      case ConnectionState.done :
                        if( snapshot.hasError ){
                          print("lista: Erro ao carregar");
                        } else {

                          retorno = ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index){
                                List<Post>? lista = snapshot.data;
                                Post post = lista![index];

                                return ListTile(
                                  title: Text(post.title),
                                  subtitle: Text(post.id.toString()),
                                );
                              }
                          );
                        }
                        break;
                    }
                    return retorno;
                  },
                ),
            )
          ],
        ),
      ),
    );
  }
}
