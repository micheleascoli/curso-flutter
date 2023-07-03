import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _controllerCampo = TextEditingController();

  String _textoSalvo = "Nada Salvo!";

  _salvar() async {
    String valorDigitado = _controllerCampo.text;

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("nome", valorDigitado);

    print("operacao (salvar): $valorDigitado");

  }

  _recuperar() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      _textoSalvo = prefs.getString("nome") ?? "Sem valor";
    });
    print("operacao (recuperar): $_textoSalvo");

  }
  _remover() async {

    final prefs = await SharedPreferences.getInstance();
    prefs.remove("nome");

    print("operacao (remover)");

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
              _textoSalvo,
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
                    onPressed: _salvar,
                    child: Text("Salvar", style: TextStyle(fontSize: 20)),
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.all(15),
                  ),
                ),
                ElevatedButton(
                  onPressed: _recuperar,
                  child: Text("Recuperar", style: TextStyle(fontSize: 20)),
                  style:ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    textStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.all(15),
                  ),
                ),
                ElevatedButton(
                  onPressed: _remover,
                  child: Text("Remover", style: TextStyle(fontSize: 20)),
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
