import 'package:flutter/material.dart';
import 'package:news_app/src/models/news_models.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> noticias;
  const ListaNoticias({this.noticias});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (BuildContext context, int index) {
        return Text(noticias[index].title);
      },
    );
  }
}
