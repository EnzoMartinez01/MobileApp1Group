import 'package:flutter/material.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class Nosotros extends StatefulWidget {
  @override
  createState() => _Nosotros();
}

class _Nosotros extends State<Nosotros> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: mibotonitem(),
        appBar: AppBar(
          title: Text('SOBRE NOSOTROS'),
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
                            child:
                                Image.asset('images/personas.png', width: 35),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Quienes Somos',
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
                                'Somos una Empresa dedicada a la venta de periféricos y componentes de pc.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(children: [
                          Image.asset('images/grafica01.jpg', width: 120),
                        ]),
                      ),
                      SizedBox(height: 20),
                      Container(
                        height: 2,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 101, 61, 153),
                        ),
                      ),
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 10.0,
                                bottom: 10.0),
                            child: Image.asset('images/mision-cumplida.png',
                                width: 35),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Nuestra Misión',
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
                                'Creemos que las empresas pueden crecer con conciencia y tener éxito con alma, y que pueden hacerlo con el inbound.\nEs por eso que hemos creado un ecosistema que une el software, la educación y la comunidad Gamer.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
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
                        child: Row(children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10.0,
                                left: 20.0,
                                right: 10.0,
                                bottom: 10.0),
                            child: Image.asset('images/vision.png', width: 35),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Nuestra Visión',
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
                                'Ser la mejor tienda virtual del rubro.',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
        ));
  }
}
