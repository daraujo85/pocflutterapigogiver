import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste/models/categoria.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'global.dart';

class GetByIdExample extends StatelessWidget {
     final Categoria categoria = Categoria();
     int id;           
  @override
  Widget build(BuildContext context) {
    final title = 'Obter por Id';

    
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
            Container(
margin: EdgeInsets.all(10),
child: TextField(
  keyboardType: TextInputType.numberWithOptions(),
  obscureText: false,
  decoration: InputDecoration(
    border: OutlineInputBorder(),
    labelText: 'ID',
  ),
   onChanged: (text) {
    id = int.parse(text);
  }
),

            ),
        FlatButton(
  color: Colors.blue,
  textColor: Colors.white,
  disabledColor: Colors.grey,
  disabledTextColor: Colors.black,
  padding: EdgeInsets.all(8.0),
  splashColor: Colors.blueAccent,
  onPressed: () {
 FutureBuilder(
            future: categoria.obterPorId(http.Client(), id),
            builder: (BuildContext context, AsyncSnapshot snapshot)
            {                            
              if(snapshot.data == null){
                 return Container(
                   child: Center(
                     child: Text("Carregando..."),
                   ),
                 );
              }
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
                                snapshot.data.background, 
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
                      snapshot.data.descricao,
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
  child: Text(
    "Flat Button",
    style: TextStyle(fontSize: 20.0),
  ),
), 
         
          ],
          )
        ),
      ),
    );
  }
 }