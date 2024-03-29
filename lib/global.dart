import 'package:flutter/material.dart';
import 'package:path/path.dart';

const SERVER_API = "devsync.ddns.net";
const SERVER_WEBSITE = "devsync.ddns.net";
const TOKEN = "";
const CAT_GET_ALL = "http://$SERVER_API/api/Categoria/ListarTodos";
const CAT_GET_BY_ID = "http://$SERVER_API/api/Categoria/ObterPorId";
const IMG_PATH = "$SERVER_WEBSITE/img/";

// user defined function
  void msgBox(BuildContext context, String titulo, String mensagem) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text(titulo),
          content: new Text(mensagem),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Ok"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      }
    );
  }