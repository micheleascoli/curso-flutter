import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TelaEmpresa extends StatefulWidget {
  const TelaEmpresa({Key? key}) : super(key: key);

  @override
  State<TelaEmpresa> createState() => _TelaEmpresaState();
}

class _TelaEmpresaState extends State<TelaEmpresa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Empresa"),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset("images/detalhe_empresa.png"),
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Sobre a empresa",
                      style: TextStyle(color: Colors.deepOrange, fontSize: 20),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16),
                child:  Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc semper ultrices leo, eu gravida quam vehicula non. In nec ex felis. Maecenas sollicitudin lacinia ultrices. Nam in porta nulla, et sodales ex. Nunc velit mauris, eleifend faucibus pretium ac, cursus tempus tellus. Donec maximus eget dolor sit amet finibus. Ut bibendum ultrices mi ac volutpat. Donec eu sem ante. Donec tempor lobortis nisl, nec venenatis nisl aliquet eget. Sed molestie lacus ut ultricies cursus. Sed nulla purus, ultricies aliquam dignissim et, blandit et dolor. Etiam aliquet dui mi, eget tincidunt justo feugiat a. Nam sit amet est eget lacus semper laoreet sed eget orci. Curabitur a porttitor nisi, ornare tincidunt eros. Aliquam a nisi iaculis, mollis leo eget, laoreet odio. Aliquam molestie non dui viverra blandit. Suspendisse eleifend eros vel diam auctor, vitae tincidunt quam placerat. Integer convallis dui et nibh venenatis auctor. Maecenas nisi metus, egestas quis aliquam ac, finibus sit amet felis. Donec tempor orci et sapien sagittis rutrum. Sed sagittis eros in felis fringilla, non interdum ligula semper. Sed sed volutpat orci, sed porta lectus. Suspendisse nec enim vel diam commodo luctus. Proin pretium suscipit purus. Ut ex lacus, porttitor quis nibh malesuada, rutrum aliquam diam. Aenean blandit rhoncus diam. Ut a mattis dolor. Nam quis blandit nisl. Nunc vel tristique leo. Praesent posuere faucibus lacus ac porttitor. Cras egestas nibh eget nisi sollicitudin, vitae aliquet tellus auctor. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Pellentesque at arcu ac massa sodales feugiat non eu neque. Sed aliquam risus non iaculis imperdiet. Vestibulum consequat, sapien et convallis accumsan, turpis nisl posuere tortor, sit amet fringilla orci nibh quis augue. Integer id purus ut diam consequat sodales a id metus. Phasellus urna velit, lobortis vel lacus non, feugiat sodales lacus. Phasellus venenatis scelerisque dolor, et iaculis ligula venenatis at. Sed accumsan, turpis ut congue dapibus, quam ligula faucibus lectus, sed cursus velit odio eget quam. Mauris magna diam, auctor sit amet iaculis non, mollis sit amet diam. Pellentesque elementum justo nisl, sit amet lobortis mi tristique sodales. Suspendisse et mattis eros, et mattis libero. Suspendisse felis ex, pellentesque non vulputate vel, auctor non libero. Sed tristique metus luctus odio dictum pulvinar. Vivamus ac tortor dignissim, volutpat mi vehicula, malesuada purus. Proin mattis diam turpis, quis gravida diam cursus et. Pellentesque ac mauris faucibus, malesuada felis non, dictum quam. Vivamus commodo ex id sodales sagittis. Donec accumsan venenatis nisl malesuada pharetra. Quisque vestibulum at tortor at viverra. Pellentesque sodales tortor sit amet sagittis ullamcorper. Pellentesque volutpat ex vel ultricies iaculis. Maecenas ut nisl eu diam commodo suscipit eget et urna. Integer ut ullamcorper dui. In lacinia blandit consectetur. Sed elit elit, dapibus in lobortis non, lacinia ornare nibh. Proin a eleifend velit, non varius nulla. Pellentesque id nisi eget purus elementum tincidunt. Curabitur venenatis arcu sapien, vitae congue est condimentum in.",
                  textAlign: TextAlign.justify,
                ),
              )
             ],
          ),
        ),
      )
    );
  }
}
