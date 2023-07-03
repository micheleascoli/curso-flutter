import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCampo = TextEditingController();
  _salvar(){

  }
  _recuperar(){
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manipulação de dados"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            Text(
              "Nada Salvo!",
              style: TextStyle(
                  fontSize: 20
              ),
            ),

            TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Digite algo"
                  ),
                controller: _controllerCampo,
            ),
            Row(
              children: [
                ElevatedButton(
                    onPressed: _salvar(),
                    child: Text("Salvar", style: TextStyle(fontSize: 20)),
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.all(15),
                  ),
                ),
                ElevatedButton(
                  onPressed: _recuperar(),
                  child: Text("Ler", style: TextStyle(fontSize: 20)),
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.all(15),
                  ),
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}
