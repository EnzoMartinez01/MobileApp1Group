import 'package:flutter/material.dart';
import 'package:v4s/models/monitors.dart';

class MonitorSearchDelegate extends SearchDelegate<Monitor> {
  final List<Monitor> listaMonitor;

  MonitorSearchDelegate(this.listaMonitor);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(
            Icons.clear,
            color: Colors.white,
          ),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.blueAccent,
      ),
      onPressed: () {
        close(
            context,
            Monitor(
                id: '',
                idd: 0,
                descripcion: '',
                imagen: '',
                precio: 0,
                categoria: 'false'));
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listaFiltrada = query.isEmpty
        ? listaMonitor
        : listaMonitor
            .where((procesador) => procesador.descripcion
                .toLowerCase()
                .contains(query.toLowerCase()))
            .toList();

    return ListView.builder(
      itemCount: listaFiltrada.length,
      itemBuilder: (BuildContext context, int index) {
        return _cardProcesador(listaFiltrada[index], context);
      },
    );
  }
}

Widget _cardProcesador(Monitor productoFiltrado, context) {
  return Card(
    child: Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(productoFiltrado.imagen),
          ),
          title: Text(productoFiltrado.descripcion),
          subtitle: Text('\S/.${productoFiltrado.precio}'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(context, 'ruta_productos_form',
                arguments: productoFiltrado);
          },
        )
      ],
    ),
  );
}
