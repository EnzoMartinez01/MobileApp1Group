import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:v4s/models/carritoproducto.dart';
import 'package:v4s/providers/carritoprovider.dart';

import 'package:v4s/widgets/mibotonitem.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class ReportScreen extends StatefulWidget {
  ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    final carritoProvider = Provider.of<CarritoProvider>(context);
    final List<CarritoReport> listaCarritoReport =
        carritoProvider.listaCarritoReport;

    List<charts.Series<CarritoReport, String>> serie = [
      charts.Series(
          id: 'ReportesCarrito',
          data: listaCarritoReport,
          domainFn: (CarritoReport serie, _) => serie.id,
          measureFn: (CarritoReport serie, _) => serie.count,
          colorFn: (CarritoReport serie, _) =>
              charts.ColorUtil.fromDartColor(Colors.redAccent))
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('REPORTE CARRITO'),
        backgroundColor: Color(0xff181d3b),
      ),
      bottomNavigationBar: mibotonitem(),
      body: Center(
          child: Container(
        height: 400,
        padding: EdgeInsets.all(20),
        child: Card(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Text('REPORTE DE PRODUCTOS '),
                  Expanded(
                      child: charts.BarChart(
                    serie,
                    animate: true,
                  ))
                ],
              )),
        ),
      )),
    );
  }
}
