  import 'package:flutter/material.dart';

  class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);

    @override
    State<Home> createState() => _HomeState();
  }

  class _HomeState extends State<Home> {

    TextEditingController _controllerAlcool = TextEditingController();
    TextEditingController _controllerGasolina = TextEditingController();
    String _texoResultado = "";

    void _calcular(){
      double? precoAlcool = double.tryParse( _controllerAlcool.text );
      double? precoGasolina = double.tryParse( _controllerGasolina.text );

      if( precoAlcool == null  ||  precoGasolina == null){
        setState(() {
          _texoResultado = "Número inválido, digite números maiores que 0 e utilizando (.)";
        });
      } else {
        /*
        * Se o preço do álcool dividido pelo preço da gasolina
        * for >= a 0.7 é melhor abastecer com gasolina
        * se não é melhor abastecer com álcool.
        */
        if(( precoAlcool/precoGasolina) >= 0.7){
          setState(() {
            _texoResultado = "Melhor abastecer com Gasolina";
          });
        } else {
          setState(() {
            _texoResultado = "Melhor abastecer com Álcool";
          });
        }
        // _limparCampos();
      }
    }

    void _limparCampos(){
      _controllerGasolina.text = "";
      _controllerAlcool.text = "";
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
         title: Text("Alcool ou Gasolina"),
         backgroundColor: Colors.indigo,
        ),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Saiba qual a melhor opção para abastecimento do seu carro",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Álcool, ex: 1.59"
                  ),
                  style: TextStyle(
                      fontSize: 22
                  ),
                  controller: _controllerAlcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "Preço Gasolina, ex: 3.59"
                  ),
                  style: TextStyle(
                      fontSize: 22
                  ),
                  controller: _controllerGasolina,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        padding: EdgeInsets.all(15)
                    ),
                    onPressed: _calcular,
                    child: Text(
                      "Calcular",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    _texoResultado,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
