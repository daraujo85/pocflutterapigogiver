class Erro{

String chave;
String valor;

Erro({
  this.chave,
  this.valor
});

//Este e um metodo estatico
factory Erro.fromJson(Map<String, dynamic> json)
{
  return Erro(
    chave:  json["chave"],
    valor:  json["valor"]
    );
}

}