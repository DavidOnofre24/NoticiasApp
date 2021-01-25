import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsProvider with ChangeNotifier {
  List<Article> encabezados = [];
  final _urlNews = 'https://newsapi.org/v2';
  final _apiKey = '937f21122c2e4e82a95ef75290304c21';

  NewsProvider() {
    this.getTopHeadLines();
  }

  getTopHeadLines() async {
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=co';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    this.encabezados.addAll(newsResponse.articles);

    notifyListeners();
  }
}
