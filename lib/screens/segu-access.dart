import 'package:flutter/material.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class Sacceso extends StatefulWidget {
  @override
  createState() => _Sacceso();
}

class _Sacceso extends State<Sacceso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('SEGURIDAD Y ACCESO'),
        backgroundColor: Color(0xff181d3b),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          ListTile(
            leading: Image.asset('images/candado.png', width: 35),
            title: Text('Seguridad'),
            subtitle: Text(
                "Administra la seguridad de tu cuenta:\nAutenticación.\nProtección de contraseña."),
            onTap: () {
              Navigator.pushReplacementNamed(context, 'ruta_segurid');
            },
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.purple.shade300, width: 3)),
            child: Column(
              children: [
                ListTile(
                  leading: Image.asset('images/mobile-shopping.png', width: 35),
                  title: Text('Cuentas Conectadas'),
                  subtitle: Text(
                      "Aqui te mostramos las cuentas que están\nconectadas:"),
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.asset('images/facebook.png', width: 30),
                        title: Text('user-2022@hotmail.com',
                            style: TextStyle(fontSize: 12, color: Colors.blue)),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '');
                        },
                      ),
                      ListTile(
                        leading: Image.asset('images/google.png', width: 30),
                        title: Text('user03-2021@gmail.com',
                            style: TextStyle(fontSize: 12, color: Colors.blue)),
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '');
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
