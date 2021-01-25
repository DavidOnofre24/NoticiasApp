import 'package:flutter/material.dart';
import 'package:news_app/src/providers/news_provider.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(body: ListaNoticias(newsProvider.encabezados));
  }
}
