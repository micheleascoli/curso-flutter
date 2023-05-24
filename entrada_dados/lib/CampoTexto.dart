import 'package:flutter/material.dart';

class CampoTexto extends StatefulWidget {
  const CampoTexto({Key? key}) : super(key: key);

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {

  TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Entrada de dados"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(32),
              child: TextField(
                // text, number, emailAddres, datetime
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: "Digite um valor"
                ),
                //enabled: false,
                //maxLength: 2,
                 style: TextStyle(
                  fontSize: 50,
                  color: Colors.green,
                ),
                //senha
                //obscureText: true,

                /*onChanged: (String e){
                  print("Valor digitado: "+ e);
                },*/

                onSubmitted: (String e){
                  print("Valor digitado: "+ e);
                },
                controller: _textEditingController,
              ),
          ),
          ElevatedButton(
              onPressed: (){
                print("Valor digitado: "+ _textEditingController.text);
              },
              child: Text("Salvar"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
          )
        ],
      ),
    );
  }
}
