import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _preco = "0";

  _atualizarPreco() async {

    var url = Uri.parse("https://blockchain.info/ticker");
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = jsonDecode(response.body);


    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                    "R\$ " + _preco,
                    style: TextStyle(
                        fontSize:35
                    )
                ),
              ),

              ElevatedButton(
                onPressed: _atualizarPreco,
                child: Text("Atualizar"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    textStyle: TextStyle(fontSize: 20),
                  padding: EdgeInsets.fromLTRB(30, 15, 30, 15)
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
