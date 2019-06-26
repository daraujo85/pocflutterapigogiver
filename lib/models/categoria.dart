import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teste/global.dart';

class Categoria{
int id;
String descricao;
String icone;
String background;

Categoria({
  this.id,
  this.descricao,
  this.icone,
  this.background
});

//Este e um metodo estatico
factory Categoria.fromJson(Map<String, dynamic> json)
{
  return Categoria(
    id:  json["id"],
    descricao:  json["descricao"],
    icone:  json["icone"],
    background:  json["background"]
    );
}

Future<List<Categoria>> obterTodas(http.Client client) async{
  
  final response = await client.get(CAT_GET_ALL);

  if(response.statusCode == 200)
  {
    var dataResponse = json.decode(response.body);

    final categorias = await dataResponse.map<Categoria>((json){
      
      return Categoria.fromJson(json);

    }).toList();

    return categorias;
  }
  else
  {
    throw Exception("Falha ao carregar os dados da API");
  }

}

}