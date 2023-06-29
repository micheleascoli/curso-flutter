import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
        title: Image.asset(
            "images/youtube.png",
        width: 98,
          height: 22,
        ),
        actions: [
          IconButton(
              onPressed: (){
                print("acao: videocam");
              },
              icon: Icon(Icons.videocam)
          ),
          IconButton(
              onPressed: (){
                print("acao: search");
              },
              icon: Icon(Icons.search)
          ),
          IconButton(
              onPressed: (){
                print("acao: pesquisa");
              },
              icon: Icon(Icons.account_circle)
          )
        ],
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.shifting,
        //fixedColor: Colors.red,
        //unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            label: "Início",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.red,
            label: "Em alta",
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blue,
            label: "Incrições",
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            label: "Biblioteca",
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
