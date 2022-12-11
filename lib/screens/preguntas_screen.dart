import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/preguntas.dart';
import 'package:v4s/models/preguntas_report.dart';
import 'package:v4s/providers/preguntas_provider.dart';
import 'package:v4s/widgets/mibotonitem.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PreguntasScreen extends StatefulWidget {
  @override
  createState() => _PreguntasScreen();
}

enum Eleccion { si, no }

class _PreguntasScreen extends State<PreguntasScreen> {
  final _formKey = GlobalKey<FormState>();

  Eleccion? _pregEleccion = Eleccion.si;

  @override
  Widget build(BuildContext context) {
    final preguntasProvider = Provider.of<PreguntasProvider>(context);
    final List<Pregunta> listaPreguntas = preguntasProvider.listaPreguntas;
    final List<PreguntasReport> listaPreguntasReport =
        preguntasProvider.listaPreguntasReport;

    List<charts.Series<PreguntasReport, String>> serie = [
      charts.Series(
          id: 'ReportePreguntas',
          data: listaPreguntasReport,
          domainFn: (PreguntasReport serie, _) => serie.id,
          measureFn: (PreguntasReport serie, _) => serie.count,
          colorFn: (PreguntasReport serie, _) =>
              charts.ColorUtil.fromDartColor(Colors.blueAccent))
    ];

    return Scaffold(
        bottomNavigationBar: mibotonitem(),
        appBar: AppBar(
          title: Text('PREGUNTAS FRECUENTES'),
          backgroundColor: Color(0xff181d3b),
        ),
        body: Container(
            padding: const EdgeInsets.all(10.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(15),
                    elevation: 10,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 20, 10),
                            title: Text('¿CÓMO EFECTUAR EL PAGO?'),
                            subtitle: Text(
                                'Para efectuar la compra se debe seleccionar un producto y en el carrito seleccionar el metodo de pago y poner tus datos, recibiras un correo con el recibo generado.\n'),
                            leading: Icon(Icons.lock)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: AssetImage('images/escudo.png')),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 20, 20)),
                            Text("¿TE RESULTO UTIL LA RESPUESTA?")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                                value: Eleccion.si,
                                groupValue: _pregEleccion,
                                onChanged: (value) {
                                  setState(() {
                                    _pregEleccion = value as Eleccion?;
                                    print(_pregEleccion);
                                  });
                                }),
                            Text('SI'),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                                value: Eleccion.no,
                                groupValue: _pregEleccion,
                                onChanged: (value) {
                                  setState(() {
                                    _pregEleccion = value as Eleccion?;
                                    print(_pregEleccion);
                                  });
                                }),
                            Text('NO'),
                            SizedBox(
                              width: 20,
                            )
                          ],
                        ),
                        Container(
                          child: ElevatedButton(
                            child: const Text('Enviar'),
                            onPressed: () {
                              var preguntasEleccion = Pregunta(
                                id: '',
                                preguntaId: 0,
                                eleccion: _pregEleccion.toString(),
                              );

                              preguntasProvider
                                  .savePreguntas(preguntasEleccion);
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text("¡GENIAL!"),
                                        content: const Text(
                                            'Recibimos tu respuesta.'),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cerrar'),
                                              child: const Text('Cerrar'))
                                        ],
                                      ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(15),
                    elevation: 10,
                    child: Column(
                      children: <Widget>[
                        ListTile(
                            contentPadding: EdgeInsets.fromLTRB(15, 10, 20, 10),
                            title:
                                Text('¿CÓMO PODRIA CONTACTAR CON UN ASESOR?'),
                            subtitle: Text(
                                'Para poder contactar con un asesor podria ser via correo electronico o vía WhatsApp, los enlaces los dejare a continuación:' +
                                    '\n' +
                                    'Correo: service-client@virtual4store.com' +
                                    '\n' +
                                    'WhatsApp: +51 958713254'),
                            leading: Icon(Icons.mail)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Image(image: AssetImage('images/personas.png')),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                                padding: EdgeInsets.fromLTRB(15, 10, 20, 20)),
                            Text("¿TE RESULTO UTIL LA RESPUESTA?")
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Radio(
                                value: Eleccion.si,
                                groupValue: _pregEleccion,
                                onChanged: (value) {
                                  setState(() {
                                    _pregEleccion = value as Eleccion?;
                                    print(_pregEleccion);
                                  });
                                }),
                            Text('SI'),
                            SizedBox(
                              width: 20,
                            ),
                            Radio(
                                value: Eleccion.no,
                                groupValue: _pregEleccion,
                                onChanged: (value) {
                                  setState(() {
                                    _pregEleccion = value as Eleccion?;
                                    print(_pregEleccion);
                                  });
                                }),
                            Text('NO'),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                        Container(
                          child: ElevatedButton(
                            child: const Text('Enviar'),
                            onPressed: () {
                              var preguntasEleccion = Pregunta(
                                id: '',
                                preguntaId: 0,
                                eleccion: _pregEleccion.toString(),
                              );

                              preguntasProvider
                                  .savePreguntas(preguntasEleccion);
                              showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                        title: const Text("¡GENIAL!"),
                                        content: const Text(
                                            'Recibimos tu respuesta.'),
                                        actions: <Widget>[
                                          TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cerrar'),
                                              child: const Text('Cerrar'))
                                        ],
                                      ));
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 400,
                  height: 100,
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    margin: EdgeInsets.all(15),
                    elevation: 10,
                    child: Column(
                      children: <Widget>[
                        Text('REPORTE DE RESPUESTAS'),
                        Expanded(
                          child: charts.BarChart(
                            serie,
                            animate: true,
                          ),
                        ),
                        Text('Fuente: BASE DE DATOS')
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
