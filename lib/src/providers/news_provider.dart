import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart';

class NewsProvider with ChangeNotifier {
  List<Article> encabezados = [];

  NewsProvider() {
    this.getTopHeadLines();
  }

  getTopHeadLines() {
    print('Cargando Headlines');
  }
}
