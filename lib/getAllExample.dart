import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste/models/categoria.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GetAllExample extends StatelessWidget {
     final Categoria categoria = Categoria();
                
  @override
  Widget build(BuildContext context) {
    final title = 'Listar Todos';
   
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: FutureBuilder(
            future: categoria.obterTodas(http.Client()),
            builder: (BuildContext context, AsyncSnapshot snapshot)
            {                            
              if(snapshot.data == null){
                 return Container(
                   child: Center(
                     child: Text("Carregando..."),
                   ),
                 );
              }
              return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Card(
            margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
                   
                new Container(
            
            child: new Image.network(
                                snapshot.data[index].background, 
                                //width: 250.0,
                                fit: BoxFit.scaleDown                               
                                ),                                                     
            padding: EdgeInsets.all(10.0)
         ),
         new Padding(
                  padding: EdgeInsets.all(8.0),
                  child: new Container(
                        width: 500,
                        child: new Column (
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  <Widget>[
                          new Text(
                      snapshot.data[index].descricao,
                        style: new TextStyle(fontSize:20.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto")
                      ),
                      new Padding(
                        padding: EdgeInsets.fromLTRB(0, 8.0, 0, 0),
                        child: new Text(
                        "Uma descrição qualquer sobre a categoria",
                        style: new TextStyle(fontSize:18.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w300,
                        fontFamily: "Roboto")
                      )
                      )
                       
                      ],
                      
                  ),
                  padding: EdgeInsets.all(8.0)
                  )
                )
            ]
          )
          ),
                
 
        ]

      );
         
                },
              );
            },
          ),
        ),
      ),
    );
  }
 }