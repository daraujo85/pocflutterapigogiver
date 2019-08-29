import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:teste/home.dart';
import 'package:teste/models/categoria.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomePage()
));