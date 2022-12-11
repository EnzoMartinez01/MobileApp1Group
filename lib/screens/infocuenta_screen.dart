import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/usuario.dart';
import 'package:v4s/providers/usuarioprovider.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class InfocuentaScreen extends StatefulWidget {
  @override
  createState() => _InfocuentaScreen();
}

class _InfocuentaScreen extends State<InfocuentaScreen> {
  List<String> _paises = [
    'Perú',
    'Colombia',
    'Venezuela',
    'México',
    'Costa Rica',
    'España'
  ];
  String text = 'Ningun país seleccionado';
  String valor_actual = 'Perú';

  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<Usuario> listaUsuarios = usuarioProvider.listaUsuarios;

    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('Información de la Cuenta'),
        backgroundColor: Color(0xff181d3b),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.purple.shade300, width: 3)),
              child: Column(
                children: [
                  ListTile(
                    title: Text('Nombre de Usuario',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(
                      'Julito',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('Teléfono',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text('Añadir',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  SizedBox(height: 20),
                  ListTile(
                    title: Text('País',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    subtitle: Text(text,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  ListTile(
                    title: Text('Selecciona el país en el que vives.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  DropdownButton<String>(
                    value: valor_actual,
                    items: _paises.map((paises) {
                      return DropdownMenuItem(
                        child: new Text(paises),
                        value: paises,
                      );
                    }).toList(),
                    onChanged: (valor) {
                      setState(() {
                        text = valor!;
                        valor_actual = valor;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, 'rutalogin');
                        },
                        child: Text(
                          "Cerrar Sesión",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        textColor: Colors.red[900],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
