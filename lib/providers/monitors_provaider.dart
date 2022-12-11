import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:v4s/models/monitor_report.dart';
import 'package:v4s/models/monitor_report_response.dart';
import 'package:v4s/models/monitors.dart';
import 'package:v4s/models/monitors_response.dart';

class ProductoProvider extends ChangeNotifier {
  String _baseURL = 'thonycertus.herokuapp.com';

  List<Monitor> listaMonitor = [];
  List<ProductosReport> listaMonitorReport = [];

  ProductoProvider() {
    print('ingresando a producto');
    this.getOnProductoList();
    this.reporteProducto();
  }

  getOnProductoList() async {
    var url = Uri.http(_baseURL, '/api/monitors', {});
    final response = await http.get(url);
    print(response.body);
    final monitorsResponse = MonitorsResponse.fromJson(response.body);
    listaMonitor = monitorsResponse.monitors;
    notifyListeners();
  }

  saveProducto(Monitor monitor) async {
    var url = Uri.http(_baseURL, '/api/monitors/save');
    print(monitor.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: monitor.toJson());
    print(response.body);
    getOnProductoList();
    notifyListeners();
  }

  reporteProducto() async {
    var url = Uri.http(_baseURL, 'api/reportemonitor/productosReport');
    final response = await http.get(url);
    final monitorsReportResponse =
        MonitorsReportResponse.fromJson(response.body);
    listaMonitorReport = monitorsReportResponse.productosReport;
    notifyListeners();
  }
}
