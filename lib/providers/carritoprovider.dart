import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:v4s/models/carrito.dart';
import 'package:v4s/models/carrito_report_response.dart';
import 'package:v4s/models/carritoproducto.dart';
import 'package:v4s/models/carritoresponse.dart';

class CarritoProvider extends ChangeNotifier {
  String _baseUrl = 'thonycertus.herokuapp.com';

  List<Carrito> listacarrito = [];
  List<CarritoReport>listaCarritoReport = [];

  CarritoProvider() {
    print('ingresando a CarritoProvider');
    this.getOnProductoList();
    this.reporteCarrito();
  }

  getOnProductoList() async {
    var url = Uri.http(_baseUrl, '/api/carrito', {});
    final response = await http.get(url);
    print(response.body);
    final carritoResponse = CarritosResponse.fromJson(response.body);
    listacarrito = carritoResponse.carrito;
    notifyListeners();
  }

  saveProducto(Carrito carrito) async {
    var url = Uri.http(_baseUrl, '/api/carrito/save');
    print(carrito.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: carrito.toJson());
    print(response.body);
    getOnProductoList();
    notifyListeners();
  }
  
  reporteCarrito() async {
    var url = Uri.http(_baseUrl, 'api/reportecarrito/carritoReport');
    final response = await http.get(url);
    final carritoReportResponse =
        CarritoReportResponse.fromJson(response.body);
    listaCarritoReport = carritoReportResponse.carritoReport;
    notifyListeners();
  }
}











