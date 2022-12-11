import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/procesador_report.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:v4s/providers/procesadors_provaider.dart';
import 'package:v4s/widgets/mibotonitem.dart';

class reportprocesador extends StatefulWidget {
  reportprocesador({Key? key}) : super(key: key);

  @override
  State<reportprocesador> createState() => _reportprocesadorState();
}

class _reportprocesadorState extends State<reportprocesador> {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider2>(context);
    final List<ProductosReport> listaProductoReport =
        productoProvider.listaProcesadorReport;

    List<charts.Series<ProductosReport, String>> serie = [
      charts.Series(
          id: 'ReporteProducto',
          data: listaProductoReport,
          domainFn: (ProductosReport serie, _) => serie.id,
          measureFn: (ProductosReport serie, _) => serie.count,
          colorFn: (ProductosReport serie, _) =>
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
                  Text('reporte'),
                  Expanded(
                    child: charts.BarChart(
                      serie,
                      animate: true,
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
