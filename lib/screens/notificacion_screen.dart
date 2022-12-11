import 'package:flutter/material.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class Nortificar extends StatefulWidget {
  @override
  createState() => _Nortificar();
}

class _Nortificar extends State<Nortificar> {
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
          title: Text('NOTIFICACIONES'),
          backgroundColor: Color(0xff181d3b),
        ),
        body: Container(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.purple.shade300, width: 3)),
                  child: Column(
                    children: [
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 10.0,
                                bottom: 10.0),
                            child: Image.asset('images/notificaciones.png',
                                width: 35),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Preferencias de notificación',
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
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(
                                'Administrar la configuración de notificaciones de la aplicación:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SwitchListTile(
                                activeColor: Colors.green,
                                title: Text(
                                  'Sonidos de notificación',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                }),
                            SizedBox(height: 5),
                            SwitchListTile(
                                activeColor: Colors.green,
                                title: Text(
                                  'Notificaciones de cinta',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: _value1,
                                onChanged: (value1) {
                                  setState(() {
                                    _value1 = value1;
                                  });
                                }),
                            SizedBox(height: 5),
                            SwitchListTile(
                                activeColor: Colors.green,
                                title: Text(
                                  'Notificaciones emergentes',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: _value2,
                                onChanged: (value2) {
                                  setState(() {
                                    _value2 = value2;
                                  });
                                }),
                          ],
                        ),
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
                          children: [
                            ListTile(
                              title: Text(
                                'Otras notificaciones:',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SwitchListTile(
                                activeColor: Colors.green,
                                title: Text(
                                  'Notificaciones por correo electrónico',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: _value3,
                                onChanged: (value3) {
                                  setState(() {
                                    _value3 = value3;
                                  });
                                }),
                            SizedBox(height: 5),
                            SwitchListTile(
                                activeColor: Colors.green,
                                title: Text(
                                  'Recibir notificaciones sobre mis compras',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                value: _value4,
                                onChanged: (value4) {
                                  setState(() {
                                    _value4 = value4;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
