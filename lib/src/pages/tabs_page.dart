import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual, // Pone rojo el item
      onTap: (i) => navegacionModel.paginaActual = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Encabezados'),
      ],
    );
  }
}

class _Paginas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // Se utiliza para como se ve el pageview cuando se termina physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;
  set paginaActual(int valor) {
    this._paginaActual = valor;
    notifyListeners();
    // Cuando la pagina cambia, notifica a los widgets que estan ecuchando y hace el cambio
  }
}
