import 'package:flutter/material.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class Segurid extends StatefulWidget {
  @override
  createState() => _Segurid();
}

class _Segurid extends State<Segurid> {
  var _value = false;
  var _value1 = false;
  var _value2 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: mibotonitem(),
        appBar: AppBar(
          title: Text('SEGURIDAD'),
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
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          'Autentificación en dos fases',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
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
                            SwitchListTile(
                                activeColor: Colors.green,
                                title: Text(
                                  'Mensaje de texto',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    "Usa el teléfono móvil para recibir un\ncódigo de autentificación que deberás\nintroducir para acceder a la cuenta"),
                                value: _value,
                                onChanged: (value) {
                                  setState(() {
                                    _value = value;
                                  });
                                }),
                            SizedBox(height: 20),
                            SwitchListTile(
                                activeColor: Colors.green,
                                title: Text(
                                  'Aplicación de Autentificación',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    "Usa nuestra app para recibir un\ncódigo de autentificación que deberás\nintroducir para acceder a la cuenta"),
                                value: _value1,
                                onChanged: (value1) {
                                  setState(() {
                                    _value1 = value1;
                                  });
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Colors.purple.shade300, width: 3)),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          'Protección con contraseña adicional',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
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
                              subtitle: Text(
                                  "Activa esta opción para aumentar la seguridad de tu cuenta, ya que se solicitará información adicional para restablecer tu contraseña, se solicitaran datos tales como número de teléfono o correo electrónico."),
                            ),
                            SizedBox(height: 10),
                            SwitchListTile(
                                activeColor: Colors.green,
                                title: Text(
                                  'Protección de restablecimiento de contraseña',
                                  style: TextStyle(
                                      fontSize: 16,
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
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
