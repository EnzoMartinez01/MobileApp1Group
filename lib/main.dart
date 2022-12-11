import 'package:flutter/material.dart';
import 'package:v4s/providers/carritoprovider.dart';
import 'package:v4s/providers/monitors_provaider.dart';
import 'package:v4s/providers/preguntas_provider.dart';
import 'package:v4s/providers/procesadors_provaider.dart';
import 'package:v4s/providers/usuarioprovider.dart';
import 'package:v4s/screens/LoginScreen.dart';
import 'package:v4s/screens/accesibilidad_screen.dart';
import 'package:v4s/screens/ajustes_screen.dart';
import 'package:v4s/screens/carrito_form_screen.dart';
import 'package:v4s/screens/carrito_screen.dart';
import 'package:v4s/screens/crtsena_screen.dart';
import 'package:v4s/screens/desactcuenta.dart';
import 'package:v4s/screens/fasebeta.dart';
import 'package:v4s/screens/infocuenta_screen.dart';
import 'package:v4s/screens/lightmode_screen.dart';
import 'package:v4s/screens/login_registrarse_screen.dart';
import 'package:v4s/screens/micuenta_screens.dart';
import 'package:v4s/screens/monitor.dart';
import 'package:v4s/screens/monitormas.dart';
import 'package:v4s/screens/nosotros_screen.dart';
import 'package:v4s/screens/notificacion_screen.dart';
import 'package:v4s/screens/pancarga.dart';
import 'package:v4s/screens/preguntas_screen.dart';
import 'package:v4s/screens/principal.dart';
import 'package:provider/provider.dart';
import 'package:v4s/screens/procesador.dart';
import 'package:v4s/screens/procesadormas.dart';
import 'package:v4s/screens/reporte_usuario.dart';
import 'package:v4s/screens/reportecarrito_screen.dart';
import 'package:v4s/screens/reportemonitor.dart';
import 'package:v4s/screens/reporteprocesador.dart';
import 'package:v4s/screens/segu-access.dart';
import 'package:v4s/screens/seguridad_screens.dart';
import 'package:v4s/screens/darkmode_screen.dart';


void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UsuarioProvider(),
            lazy: false,
          ),
          ChangeNotifierProvider(
            create: (_) => CarritoProvider(),
            lazy: false,
          ),
          ChangeNotifierProvider(create: (_) => ProductoProvider()),
          ChangeNotifierProvider(create: (_) => ProductoProvider2()),
          ChangeNotifierProvider(
              create: (_) => PreguntasProvider(), lazy: false),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "VIRTUAL4STORE",
          initialRoute: "ruta_carga",
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
            'ruta_carga': (_)=> LoadingScreen(),
          },
        ));
  }
}
