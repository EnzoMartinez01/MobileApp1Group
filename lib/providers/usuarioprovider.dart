import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:v4s/models/usuario_report.dart';
import 'package:v4s/models/usuario_report_response.dart';
import 'package:v4s/models/usuarioresponse.dart';
import '../models/usuario.dart';

class UsuarioProvider extends ChangeNotifier {
  String _baseUrl = 'thonycertus.herokuapp.com';
  List<Usuario> listaUsuarios = [];
  List<UsuarioReport> listaUsuarioReport = [];

  UsuarioProvider() {
    print('INGRESANDO A USUARIO PROVIDER');
    this.getOnUsuarioList();
    this.reporteUsuario();
  }
  getOnUsuarioList() async {
    var url = Uri.http(_baseUrl, '/api/usuarios', {});
    final response = await http.get(url);
    print(response.body);
    final usuarioResponse = UsuarioResponse.fromJson(response.body);
    listaUsuarios = usuarioResponse.usuarios;
    notifyListeners();
  }

  saveUsuario(Usuario usuario) async {
    var url = Uri.http(_baseUrl, '/api/usuarios/save');
    print(usuario.toJson());
    final response = await http.post(url,
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: usuario.toJson());
    print(response.body);
    getOnUsuarioList();
    notifyListeners();
  }
  reporteUsuario() async {
      var url= Uri.http(_baseUrl, "api/reporteusuario/usuariosReport");
      final response = await http.get(url);
      final usuarioReportResponse=UsuarioReportResponse.fromJson(response.body);
          listaUsuarioReport = usuarioReportResponse.usuarioReport;
       notifyListeners();
    }
}
