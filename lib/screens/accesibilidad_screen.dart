import 'package:flutter/material.dart';
import 'package:v4s/widgets/mibotonitem.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:v4s/main.dart';

class Accsesib extends StatefulWidget {
  @override
  createState() => _Accsesib();
}

class _Accsesib extends State<Accsesib> {
  var _value = false;
  var _value1 = false;
  var _value2 = false;
  var _value3 = false;
  var _value4 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('ACCESIBILIDAD'),
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
                    child: Row(children: <Widget>[
                      Container(
                        padding: const EdgeInsets.only(
                            top: 10.0, left: 20.0, right: 10.0, bottom: 10.0),
                        child: Image.asset('images/modo-oscuro.png', width: 35),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Pantalla',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ]),
                  ),
                  Container(
                    height: 2,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 101, 61, 153),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            'Modo Claro',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 95, 69, 100)),
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, 'ruta_lightmode');
                          },
                        ),
                        ListTile(
                          title: Text(
                            'Modo Oscuro',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 95, 69, 100)),
                          ),
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, 'ruta_darkmode');
                          },
                        ),
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
