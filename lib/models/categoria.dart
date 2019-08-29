import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:teste/global.dart';

import 'erro.dart';

class Categoria{
int id;
String descricao;
String slug;
String icone;
String background;

Categoria({
  this.id,
  this.descricao,
  this.slug,
  this.icone,
  this.background
});

//Este e um metodo estatico
factory Categoria.fromJson(Map<String, dynamic> json)
{
  return Categoria(
    id:  json["id"],
    descricao:  json["descricao"],
    slug:  json["slug"],
    icone:  json["icone"],
    background:  "https://redegvc.com.br/uploads/" + json["background"]
    );
}

Future<List<Categoria>> obterTodas(http.Client client) async{
  
  final response = await client.get(CAT_GET_ALL);

  if(response.statusCode == 200)
  {
    var dataResponse = json.decode(response.body);

    print(dataResponse['data']);

    //List<Categoria> list = new List<Categoria>.generate(3, (index)=>Categoria.fromJson(dataResponse['data'][index]));
    
    //return list;

    if(dataResponse['success'] == true)
    {    
      //var categorias = await dataResponse['data'].map((s) => Categoria.fromJson(s)).toList();

      var categorias = ((dataResponse['data']) as List).map((e) => new Categoria.fromJson(e)).toList();
      
      return categorias;
    }
    
  
  }
  else if (response.statusCode < 500)
  {
     var dataResponse = json.decode(response.body);

    throw Exception(dataResponse['erros']);
  }

}
Future<Categoria> obterPorId(http.Client client, int id) async{
  
  var url = CAT_GET_BY_ID + "/" + id.toString();

  final response = await client.get(url);

  if(response.statusCode == 200)
  {
    var dataResponse = json.decode(response.body);

    //List<Categoria> list = new List<Categoria>.generate(3, (index)=>Categoria.fromJson(dataResponse['data'][index]));
    
    //return list;

    if(dataResponse['success'] == true)
    {    
      
      var categoria = Categoria.fromJson(dataResponse['data']);

      
      return categoria;
    }
    
  
  }
  else if (response.statusCode < 500)
  {
    var dataResponse = json.decode(response.body);

    var erros = ((dataResponse['errors']) as List).map((e) => new Erro.fromJson(e)).toList();  
    
    
        
   }

}


}