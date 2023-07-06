import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List _lista = ["Michele", "Maria", "Antônio", "Luis", "Jamilton"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                itemCount: _lista.length,
                itemBuilder: (context, index){
                  final item = _lista[index];


                  return Dismissible(
                      background: Container(
                        color: Colors.red,
                      ),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction){
                        print("direcao: "+direction.toString());
                      },
                      key: Key(item),
                      child: ListTile(
                        title: Text(item),
                      )
                  );
                },
              )
          )
        ],
      )
    );
  }
}
