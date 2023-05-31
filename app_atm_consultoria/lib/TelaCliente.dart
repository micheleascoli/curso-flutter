import 'package:flutter/material.dart';

class TelaCliente extends StatefulWidget {
  const TelaCliente({Key? key}) : super(key: key);

  @override
  State<TelaCliente> createState() => _TelaClienteState();
}

class _TelaClienteState extends State<TelaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Clientes"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("images/detalhe_cliente.png"),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        "Clientes",
                        style: TextStyle(color: Colors.lightGreen, fontSize: 20),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child:  Image.asset("images/cliente1.png"),
                ),
                Text("Empresa de Software"),

                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child:  Image.asset("images/cliente2.png"),
                ),
                Text("Empresa de Auditoria"),

              ],
            ),
          ),
        )
    );
  }
}
