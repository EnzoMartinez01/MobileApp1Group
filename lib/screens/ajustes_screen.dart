import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class AjustesScreen extends StatelessWidget {
  const AjustesScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuración'),
        backgroundColor: Color(0xff181d3b),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'Ingresar un Criterio de Búsqueda',
                  prefixIcon: Image.asset('images/lupa.png', scale: 2),
                  labelText: 'Configuración de Búsqueda',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(children: [
                    ListTile(
                      leading: Image.asset('images/login.png', width: 35),
                      title: Text('Tu Cuenta'),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, 'ruta_micuenta');
                      },
                    ),
                  ])),
              SizedBox(height: 20),
              Container(
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(children: [
                    ListTile(
                      leading: Image.asset('images/candado.png', width: 35),
                      title: Text('Seguridad y Acceso'),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, 'ruta_sacceso');
                      },
                    ),
                  ])),
              SizedBox(height: 20),
              Container(
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(children: [
                    ListTile(
                      leading:
                          Image.asset('images/notificacion.png', width: 35),
                      title: Text('Notificaciones'),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, 'ruta_notificar');
                      },
                    ),
                  ])),
              SizedBox(height: 20),
              Container(
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(children: [
                    ListTile(
                      leading:
                          Image.asset('images/accesibilidad.png', width: 35),
                      title: Text('Accesibilidad'),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, 'ruta_Accesibilidad');
                      },
                    ),
                  ])),
              SizedBox(height: 20),
              Container(
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(children: [
                    ListTile(
                      leading:
                          Image.asset('images/subcontratacion.png', width: 35),
                      title: Text('Sobre Nosotros'),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, 'ruta_nosotros');
                      },
                    ),
                  ])),
              SizedBox(height: 20),
              Container(
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(children: [
                    ListTile(
                      leading: Image.asset('images/idioma.png', width: 35),
                      title: Text('Preguntas Frecuentes'),
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, 'ruta_preguntas');
                      },
                    ),
                  ])),
            ]),
          ),
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Color(0xffcc979f),
        children: [
          SpeedDialChild(
            child: Icon(Icons.graphic_eq),
            label: "Consultar",
            onTap: () {
              Navigator.pushReplacementNamed(context, 'reporteusuario');
            },
          ),
        ],
      ),
      bottomNavigationBar: mibotonitem(),
    );
  }
}
