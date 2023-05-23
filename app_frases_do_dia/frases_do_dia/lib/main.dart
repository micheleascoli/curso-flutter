  import 'package:flutter/material.dart';
  import 'dart:math';

  void main(){
    runApp(MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    ));
  }

  class Home extends StatefulWidget {
    const Home({Key? key}) : super(key: key);

    @override
    State<Home> createState() => _HomeState();
  }

  class _HomeState extends State<Home> {

    var _frases = [
      "É em meio a dificuldade que se encontra a oportunidade.",
      "O êxito é ir de frustração a frustração sem perder a animação.",
      "Mesmo que algo pareça difícil, nunca desista antes de tentar.",
      "Você é o único que entende as suas dificuldades, por isso motive se a prosseguir.",
      "Não é uma vida ruim, é apenas um dia ruim, lembre-se disso.",
      "A maior prova de que você pode fazer o impossível, é superar circunstâncias difíceis.",
      "Que os dias bons se tornem rotina, e os ruins se tornem raros.",
      "É genial celebrar a vitória, contudo é mais significativo aprender com as lições da derrota.",
      "Qualquer dificuldade pode ser ultrapassada, já que para todo problema há uma solução.",
      "Já pensou que você já superou muitas dificuldades até aqui?.",
      "Suas pequenas vitórias são todas as dificuldades superadas durante sua vida, tenha orgulho delas.",
      "Cada dificuldade ultrapassada te faz mais forte.",
      "Desistir não deve ser considerado, mesmo que as coisas não sejam fáceis.",
      "O êxito é a somatória dos pequenos esforços repetidos diariamente.",
      "Para quem está iluminado, os dias de luz sempre retornam.",
      "Conheci o pior das pessoas e o melhor de mim, passando por tempos difíceis.",
      "Você não vai encontrar ninguém para sorrir por ti, então não deixe de sorrir.",
      "Mesmo que nem todo dia seja bom, há algo de bom todo dia.",
      "Em dias difíceis, lembre-se do que Deus já fez por ti. Recorde o que pode te oferecer esperança.",
      "Da mesma forma que a felicidade não dura para sempre, a tristeza também não.",
      "As dores não são eternas, se permita, o seu melhor é o suficiente.",
      "Mesmo que a jornada seja lenta, abrir mão não acelera"
          "Que a expectativa por dias melhores nunca nos falte.",
      "Você é maior do que toda essa tormenta, seja resiliente.",
      "A vida é um eterno recomeço.",
    ];

    var _fraseGerada = "Clique abaixo para gerar uma frase!";
    
    void _gerarFrase(){
      var numeroSorteado = Random().nextInt(_frases.length);
      setState(() {
        _fraseGerada = _frases[numeroSorteado];
      });
    }    

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Frases do dia"),
          backgroundColor: Colors.green,
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16),
            //width: double.infinity,
            /*decoration: BoxDecoration(
                border: Border.all(width: 3, color: Colors.amber)
            ),*/
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/logo.png"),
                Text(
                  _fraseGerada,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.italic,
                      color: Colors.black
                  ),
                ),
                ElevatedButton(
                  child: Text(
                    "Nova Frase",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: _gerarFrase,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }

