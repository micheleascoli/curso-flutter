import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  _recuperarCep() async {  // método assíncrono
    var url = Uri.parse("https://viacep.com.br/ws/69918412/json/");
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = jsonDecode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    print(
      "Resposta \n"
          "logradouro: ${logradouro} \n"
          "complemento: ${complemento} \n"
          "bairro: ${bairro} \n"
          "localidade: ${localidade} \n"
    );

    //print("Resposta "+ response.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço web"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: _recuperarCep,
                child: Text("Clique aqui")
            )
          ],
        ),
      ),
    );
  }
}
