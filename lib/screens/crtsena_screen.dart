import 'package:flutter/material.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class Crtrasena extends StatefulWidget {
  @override
  createState() => _Crtrasena();
}

class _Crtrasena extends State<Crtrasena> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('Cambiar la Contraseña'),
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
                    child: Column(children: <Widget>[
                      Container(
                          child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20.0, bottom: 10.0),
                            child: Text(
                              'Contraseña Actual',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                      Container(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Container(
                                width: 320.0,
                                height: 40.0,
                                child: TextFormField(
                                  autocorrect: false,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      suffixIcon:
                                          const Icon(Icons.remove_red_eye)),
                                  //controller: txtcontra,
                                  validator: (value) {
                                    if (value!.length < 5) {
                                      return 'La contraseña debe tener minimo 5 caracteres';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              )
                            ],
                          )),
                      Container(
                          child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20.0, bottom: 10.0),
                            child: Text(
                              'Contraseña Nueva',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                      Container(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Container(
                                width: 320.0,
                                height: 40.0,
                                child: TextFormField(
                                  autocorrect: false,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      suffixIcon:
                                          const Icon(Icons.remove_red_eye)),
                                  //controller: txtcontra,
                                  validator: (value) {
                                    if (value!.length < 5) {
                                      return 'La contraseña debe tener minimo 5 caracteres';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              )
                            ],
                          )),
                      Container(
                          child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 20.0, bottom: 10.0),
                            child: Text(
                              'Confirmar Contraseña',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      )),
                      Container(
                          padding: const EdgeInsets.only(left: 20.0),
                          child: Row(
                            children: [
                              Container(
                                width: 320.0,
                                height: 40.0,
                                child: TextFormField(
                                  autocorrect: false,
                                  obscureText: true,
                                  keyboardType: TextInputType.text,
                                  decoration: InputDecoration(
                                      hintText: '',
                                      border: OutlineInputBorder(),
                                      isDense: true,
                                      contentPadding: EdgeInsets.all(8),
                                      filled: true,
                                      suffixIcon:
                                          const Icon(Icons.remove_red_eye)),
                                  //controller: txtcontra,
                                  validator: (value) {
                                    if (value!.length < 5) {
                                      return 'La contraseña debe tener minimo 5 caracteres';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              )
                            ],
                          )),
                      SizedBox(height: 20),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          Colors.blue)),
                              child: const Text('Actualizar Contraseña',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              onPressed: () {},
                            ),
                          ]),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Text("¿Olvidaste tu Contraseña?"),
                            textColor: Colors.red[900],
                          ),
                        ],
                      ),
                      SizedBox(height: 50),
                    ]),
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
