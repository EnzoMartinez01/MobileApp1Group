import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:v4s/models/usuario_report.dart';
import 'package:v4s/widgets/mibotonitem.dart';
import '../providers/usuarioprovider.dart';

class ReporteCarritoScreen extends StatefulWidget {
  ReporteCarritoScreen({Key? key}) : super(key: key);

  @override
  State<ReporteCarritoScreen> createState() => _ReporteCarritoScreenState();
}

class _ReporteCarritoScreenState extends State<ReporteCarritoScreen> {
  @override
  Widget build(BuildContext context) {
    final usuarioProvider = Provider.of<UsuarioProvider>(context);
    final List<UsuarioReport> listaUsuarioReport =
        usuarioProvider.listaUsuarioReport;

    List<charts.Series<UsuarioReport, String>> serie = [
      charts.Series(
          id: 'ReporteUsuario',
          data: listaUsuarioReport,
          domainFn: (UsuarioReport serie, _) => serie.id,
          measureFn: (UsuarioReport serie, _) => serie.count,
          colorFn: (UsuarioReport serie, _) =>
              charts.ColorUtil.fromDartColor(Colors.redAccent))
    ];
    return Scaffold(
      bottomNavigationBar: mibotonitem(),
      appBar: AppBar(
        title: const Text('Reportes'),
        backgroundColor: Color(0xff181d3b),
      ),
      body: Center(
        child: Container(
          height: 400,
          padding: EdgeInsets.all(20),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('REPORTE DE USUARIOS POR SEXO'),
                  Expanded(
                      child: charts.BarChart(
                    serie,
                    animate: true,
                  )),
                  Text('FUENTE: MONGODB')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
