import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  _listarVideos(){
    Api api = Api();
    return api.pesquisar("");
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
      future: _listarVideos(),
      builder: (contex, snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none :
          case ConnectionState.waiting :
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active :
          case ConnectionState.done :
            if(snapshot.hasData){
              
              return ListView.separated(
                  itemBuilder: (context, index){

                    List<Video>? videos = snapshot.data;
                    Video video = videos![index];

                    return Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image:NetworkImage( video.imagem.toString() )
                            )
                          ),
                        ),
                        ListTile(
                          title: Text( video.titulo.toString() ),
                          subtitle: Text( video.canal.toString() ),
                        )
                      ],
                    );                   
                  }, 
                  separatorBuilder: (context, index) => Divider(
                    height: 3,
                    color: Colors.red,
                  ),
                  itemCount: snapshot.data!.length,
              );
              
              
            }else{
              return Center(
                child: Text("Nenhum dado a ser exibido!"),
              );
            }
            break;
            
          
        }
      },
    );
  }
}
