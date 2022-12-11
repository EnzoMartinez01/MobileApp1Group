import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:v4s/screens/LoginScreen.dart';
import 'package:v4s/screens/accesibilidad_screen.dart';
import 'package:v4s/screens/carrito_form_screen.dart';
import 'package:v4s/screens/carrito_screen.dart';
import 'package:v4s/screens/crtsena_screen.dart';
import 'package:v4s/screens/desactcuenta.dart';
import 'package:v4s/screens/fasebeta.dart';
import 'package:v4s/screens/infocuenta_screen.dart';
import 'package:v4s/screens/login_registrarse_screen.dart';
import 'package:v4s/screens/micuenta_screens.dart';
import 'package:v4s/screens/monitor.dart';
import 'package:v4s/screens/monitormas.dart';
import 'package:v4s/screens/nosotros_screen.dart';
import 'package:v4s/screens/notificacion_screen.dart';
import 'package:v4s/screens/preguntas_screen.dart';
import 'package:v4s/screens/principal.dart';
import 'package:v4s/screens/procesador.dart';
import 'package:v4s/screens/procesadormas.dart';
import 'package:v4s/screens/reporte_usuario.dart';
import 'package:v4s/screens/reportecarrito_screen.dart';
import 'package:v4s/screens/reportemonitor.dart';
import 'package:v4s/screens/reporteprocesador.dart';
import 'package:v4s/screens/segu-access.dart';
import 'package:v4s/screens/seguridad_screens.dart';
import 'package:v4s/widgets/mibotonitem.dart';
import 'package:v4s/screens/lightmode_screen.dart';
import 'ajustes_screen.dart';


class ModoOscuro extends StatefulWidget {
  @override
  createState() => _ModoOscuro();
}

class _ModoOscuro extends State<ModoOscuro>{
  final _formKey = GlobalKey<FormState>();
  bool isDarkModeEnabled = true;
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TEMA DE APLICACION',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(color: const Color(0xFF253341)),
        scaffoldBackgroundColor: const Color(0xFF15202B),
      ),
      themeMode: isDarkModeEnabled ? ThemeMode.dark : ThemeMode.light,
      home: Scaffold(
        appBar: AppBar(title: Text('TEMA DE APLICACION')),
        body: SizedBox.expand(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DayNightSwitcher(
                isDarkModeEnabled: isDarkModeEnabled,
                onStateChanged: onStateChanged,
              ),
              Padding(
                padding: EdgeInsets.only(top: 2),
                child: DayNightSwitcherIcon(
                  isDarkModeEnabled: isDarkModeEnabled,
                  onStateChanged: onStateChanged,
                ),
              ),
            ],
          ),
        ),
        
        bottomNavigationBar: mibotonitem(),
      ),
      routes: {
        'principal': (_) => principal(),
            'banner': (_) => AjustesScreen(),
            'ruta_micuenta': (_) => MicuentaScreen(),
            'ruta_infocuenta': (_) => InfocuentaScreen(),
            'ruta_desactcuenta': (_) => Desactcuenta(),
            'ruta_sacceso': (_) => Sacceso(),
            'ruta_segurid': (_) => Segurid(),
            'ruta_notificar': (_) => Nortificar(),
            'ruta_Accesibilidad': (_) => Accsesib(),
            'ruta_nosotros': (_) => Nosotros(),
            "rutalogin": (_) => LoginScreen(),
            "ruta_registro_login": (_) => RegistrologinScreen(),
            'ruta_carrito': (_) => CarritoScreen(),
            'ruta_carrito_form': (_) => CarritoFormScreen(),
            'ruta_preguntas': (_) => PreguntasScreen(),
            'ruta_crtrasena': (_) => Crtrasena(),
            'monitor': (_) => promonitor(),
            'procesador': (_) => proprocesador(),
            "beta": (_) => fasebeta(),
            "masmonitor": (_) => MoinitorFormScreen(),
            "reportemonitor": (_) => reportmonitor(),
            "masprocesador": (_) => ProcesadorFormScreen(),
            "reporteprocesador": (_) => reportprocesador(),
            "reporteusuario": (_) => ReporteCarritoScreen(),
            "ruta_reportecarrito": (_) => ReportScreen(),
            'ruta_darkmode': (_) => ModoOscuro(),
            'ruta_lightmode': (_) => ModoClaro(),
      },
    );
  }

  void onStateChanged(bool isDarkModeEnabled) {
    setState(() {
      this.isDarkModeEnabled = isDarkModeEnabled;
    });
  }

  void reDireccion () {
    AlertDialog(
                title: Text('SERA REDIRIGIDO AL MENU PRINCIPAL.'),
                content: Text('MODO OSCURO ACTIVADO'),
                actions: <Widget> [
                  FlatButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, 'principal');
                    }, 
                    child: Text('Aceptar'))
                ],
              );
  }
}

