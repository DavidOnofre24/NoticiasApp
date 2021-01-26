import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/models/news_models.dart';
import 'package:http/http.dart' as http;

class NewsProvider with ChangeNotifier {
  List<Article> encabezados = [];

  String _categoriaSeleccionada = 'business';

  List<Category> categorias = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyballBall, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology')
  ];

  Map<String, List<Article>> categotyArticles =
      {}; // Hacemos un map para tener varios articulos cargados y la aplicacion se vea rapida

  final _urlNews = 'https://newsapi.org/v2';
  final _apiKey = '937f21122c2e4e82a95ef75290304c21';

  NewsProvider() {
    this.getTopHeadLines();
    categorias.forEach((item) {
      this.categotyArticles[item.name] =
          new List(); //Con esto inicializo cada una de las categorias en el MAP
    });
    this.getArticlesByCategory(this._categoriaSeleccionada);
  }

  List<Article> get getArticulosCategoriaSeleccionada =>
      this.categotyArticles[this._categoriaSeleccionada];

  get categoriaSeleccionada => this._categoriaSeleccionada;

  set categoriaSeleccionada(String valor) {
    this._categoriaSeleccionada = valor;
    this.getArticlesByCategory(valor);

    notifyListeners();
  }

  getTopHeadLines() async {
    final url = '$_urlNews/top-headlines?apiKey=$_apiKey&country=co';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);
    this.encabezados.addAll(newsResponse.articles);

    notifyListeners();
  }

  getArticlesByCategory(String category) async {
    if (this.categotyArticles[category].length > 0) {
      return this.categotyArticles[category];
    }

    final url =
        '$_urlNews/top-headlines?apiKey=$_apiKey&country=co&category=$category';
    final resp = await http.get(url);

    final newsResponse = newsResponseFromJson(resp.body);

    this.categotyArticles[category].addAll(newsResponse.articles);

    notifyListeners();
  }
}
