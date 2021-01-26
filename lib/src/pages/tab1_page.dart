import 'package:flutter/material.dart';
import 'package:news_app/src/providers/news_provider.dart';
import 'package:news_app/src/widgets/lista_noticias.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  @override
  _Tab1PageState createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);
    return Scaffold(
        body: (newsProvider.encabezados.length == 0)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListaNoticias(newsProvider.encabezados));
  }

  @override
  bool get wantKeepAlive =>
      true; // con esto, la pagina no vuelve al inicio(Se queda en donde el usuario habia quedado)
}
