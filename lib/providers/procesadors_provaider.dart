import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:v4s/models/procesador_report.dart';
import 'package:v4s/models/procesador_report_response.dart';
import 'package:v4s/models/procesadors.dart';
import 'package:v4s/models/procesadors_response.dart';

class ProductoProvider2 extends ChangeNotifier {
  String _baseURL = 'thonycertus.herokuapp.com';

  List<Procesador> listaProcesador = [];
  List<ProductosReport> listaProcesadorReport = [];

  ProductoProvider2() {
    print('ingresando a producto');
    this.getOnProductoList();
    this.reporteProducto();
  }

  getOnProductoList() async {
    var url = Uri.http(_baseURL, '/api/procesadors', {});
    final response = await http.get(url);
    print(response.body);
    final procesadorsResponse = ProcesadorsResponse.fromJson(response.body);
    listaProcesador = procesadorsResponse.procesadors;
    notifyListeners();
  }

  saveProducto(Procesador procesador) async {
    var url = Uri.http(_baseURL, '/api/procesadors/save');
    print(procesador.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: procesador.toJson());
    print(response.body);
    getOnProductoList();
    notifyListeners();
  }

  reporteProducto() async {
    var url = Uri.http(_baseURL, 'api/reporteprocesador/productosReport');
    final response = await http.get(url);
    final procesadorsReportResponse =
        ProcesadorsReportResponse.fromJson(response.body);
    listaProcesadorReport = procesadorsReportResponse.productosReport;
    notifyListeners();
  }
}
