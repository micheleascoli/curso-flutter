import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCep = TextEditingController();
  String _resultado = "Resultado";

  _recuperarCep() async {  // método assíncrono
    String cepDigitado = _controllerCep.text;
    var url = Uri.parse("https://viacep.com.br/ws/${cepDigitado}/json/");
    http.Response response;

    response = await http.get(url);
    Map<String, dynamic> retorno = jsonDecode(response.body);
    String logradouro = retorno["logradouro"];
    String complemento = retorno["complemento"];
    String bairro = retorno["bairro"];
    String localidade = retorno["localidade"];

    setState(() {
      _resultado = "${logradouro}, ${complemento}, ${bairro}, ${localidade}";
    });

    print(
      "Resposta \n"
          "logradouro: ${logradouro} \n"
          "complemento: ${complemento} \n"
          "bairro: ${bairro} \n"
          "localidade: ${localidade} \n"
    );
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
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o cep ex: 05428200"
              ),
              style: TextStyle(
                fontSize: 20
              ),
              controller: _controllerCep,
            ),
            ElevatedButton(
                onPressed: _recuperarCep,
                child: Text("Clique aqui"),
            ),
            Text(_resultado)
          ],
        ),
      ),
    );
  }
}
