import 'package:flutter/material.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class MicuentaScreen extends StatefulWidget {
  @override
  createState() => _MicuentaScreen();
}

class _MicuentaScreen extends State<MicuentaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: Text('MI CUENTA'),
        backgroundColor: Color(0xff181d3b),
      ),
      body: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset('images/user.png', width: 35),
                title: Text('Información de la Cuenta'),
                subtitle: Text(
                    "Consulta la información de tu cuenta, obten más información acerca de tus datos"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'ruta_infocuenta');
                },
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Image.asset('images/candado.png', width: 35),
                title: Text('Cambiar la Contraseña'),
                subtitle: Text("Cambia tu contraseña en cualquier momento"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'ruta_crtrasena');
                },
              ),
              SizedBox(height: 20),
              ListTile(
                leading: Image.asset('images/corazon-roto.png', width: 35),
                title: Text('Desactivar Cuenta'),
                subtitle: Text("Averigua como puedes desactivar tu cuenta"),
                onTap: () {
                  Navigator.pushReplacementNamed(context, 'ruta_desactcuenta');
                },
              ),
            ],
          )),
    );
  }
}
