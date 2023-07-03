import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  /* O caminho onde salva os arquivos é diferente para o ios e o android:
  * ios/listatarefas/dado
  * android/data/listatarefas/dados
  * Bibliotecas:
  * */

  List _listaTarefas = [];

  _salvarArquivo() async {
    final diretorio = await getApplicationDocumentsDirectory();
    var arquivo = File("${diretorio.path}/dados.json");

    Map<String, dynamic> tarefa = Map();

    tarefa["titulo"] = "Ir ao mercado";
    tarefa["realizada"] = false;
    _listaTarefas.add(tarefa);

    String dados = json.encode(_listaTarefas);
    arquivo.writeAsString(dados);
  }

  @override
  Widget build(BuildContext context) {

    _salvarArquivo;

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Tarefas"),
        backgroundColor: Colors.purple,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.purple,
        onPressed: (){
          showDialog(
              context: context,
              builder: (context){
                return AlertDialog(
                  title: Text("Adicionar Tarefa"),
                  content: TextField(
                    decoration: InputDecoration(
                      labelText: "Digite sua tarefa"
                    ),
                    onChanged: (text){

                    },
                  ),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: (){
                        //salvar
                        Navigator.pop(context);
                      },
                      child: Text("Salvar"),
                    )
                  ],
                );
              }
          );
        },
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
               itemCount: _listaTarefas.length,
              itemBuilder: (context, index){
                 return ListTile(
                   title: Text(_listaTarefas[index]),
                 );
              },
            ),
          )
        ],
      ),
    );
  }
}
