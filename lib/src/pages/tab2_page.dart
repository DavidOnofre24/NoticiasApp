import 'package:flutter/material.dart';
import 'package:news_app/src/models/category_model.dart';
import 'package:news_app/src/providers/news_provider.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          _ListaCategorias(),
          Expanded(
            child:
                ListaNoticias(newsProvider.getArticulosCategoriaSeleccionada),
          )
        ],
      )),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewsProvider>(context).categorias;
    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categorias.length,
          itemBuilder: (BuildContext context, int index) {
            final cName = categorias[index].name;
            return Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                children: [
                  _CategoryButton(categorias[index]),
                  SizedBox(
                    height: 5,
                  ),
                  Text('${cName[0].toUpperCase()}${cName.substring(1)}'),
                ],
              ),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category categoria;

  const _CategoryButton(this.categoria);

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return GestureDetector(
      onTap: () {
        final newsProvider = Provider.of<NewsProvider>(context, listen: false);
        newsProvider.categoriaSeleccionada = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 15),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          categoria.icon,
          color: (newsProvider.categoriaSeleccionada == categoria.name)
              ? Colors.red
              : Colors.black54,
        ),
      ),
    );
  }
}
