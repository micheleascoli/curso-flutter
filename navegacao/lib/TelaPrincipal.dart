import 'package:flutter/material.dart';
import 'package:navegacao/TelaSecundaria.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tela Principal"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                   context,
                    MaterialPageRoute(
                        builder: (context) => TelaSecundaria(valor:"Michele")
                    )
                );
              },
              child: Text("Ir para a segunda tela"),
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(15)),
            )
          ],
        ),
      ),
    );
  }
}
