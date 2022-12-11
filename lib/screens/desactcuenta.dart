import 'package:flutter/material.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class Desactcuenta extends StatefulWidget {
  @override
  createState() => _Desactcuenta();
}

class _Desactcuenta extends State<Desactcuenta> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('Desactivar la Cuenta'),
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
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      'Qué tienes que Saber',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Si desactivas tu cuenta tienes un plazo de 30 dias para recuperarla caso contrario será eliminada, Perderas el accesso a todos los beneficios que te brinda si quieres saber más ingresa a el enlace:',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'VIRTUAL4STORE',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 17, 255)),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            'Es por ello que tienes que leer la información antes de acceder.',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Más información',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 0, 225, 255)),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          height: 2,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 101, 61, 153),
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            FlatButton(
                              onPressed: () {},
                              child: Text(
                                "DESACTIVAR",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
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
          ],
        ),
      ),
    );
  }
}
