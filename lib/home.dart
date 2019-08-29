import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'getAllExample.dart';
import 'getByIdExample.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indiceAtual = 0;
  String _titleActivy = "Destaque";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      GetByIdExample(),
      GetAllExample()
    ];

    return Scaffold(

      appBar: AppBar(),
      body: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        child: telas[_indiceAtual],
      ),

      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        color: Colors.red,
        notchMargin: 4,
        clipBehavior: Clip.antiAlias,
        child: BottomNavigationBar(
            currentIndex: _indiceAtual,

            onTap: (indice){
              setState(() {
                _indiceAtual = indice;

                switch (_indiceAtual){
                  case 0:
                    _titleActivy = 'Obter por Id';
                    break;

                  case 1:
                    _titleActivy = 'Listar Todos';
                    break;

                }


              });
            },

            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.filter_1), title: Text("Obter por Id")),
              BottomNavigationBarItem(icon: Icon(Icons.list), title: Text("Listar Todos"))
            ]),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


    );
  }
}