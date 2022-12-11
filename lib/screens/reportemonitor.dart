import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/monitor_report.dart';
import 'package:v4s/providers/monitors_provaider.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:v4s/widgets/mibotonitem.dart';

class reportmonitor extends StatefulWidget {
  reportmonitor({Key? key}) : super(key: key);

  @override
  State<reportmonitor> createState() => _reportmonitorState();
}

class _reportmonitorState extends State<reportmonitor> {
  @override
  Widget build(BuildContext context) {
    final productoProvider = Provider.of<ProductoProvider>(context);
    final List<ProductosReport> listaProductoReport =
        productoProvider.listaMonitorReport;

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
