import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Floating Action Button"),
      ),
      body: Text("Conteúdo"),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      //floatingActionButton: FloatingActionButton(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 6,
        icon: Icon(Icons.add_shopping_cart),
        label: Text("Adicionar"),
        /*shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(50)
        ),
         */
        //mini: true,

       //child: Icon(Icons.add),
        onPressed: (){
          print("Resultado: botão pressionado!");
        },
      ),
      bottomNavigationBar: BottomAppBar(
       //shape: CircularNotchedRectangle(),
        child: Row(
          children: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.add)
            )
          ],
        ),
      ),

    );
  }
}
