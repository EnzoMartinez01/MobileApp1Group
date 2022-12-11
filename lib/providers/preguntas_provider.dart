import 'dart:io';
import 'package:flutter/material.dart';
import 'package:v4s/models/preguntas.dart';
import 'package:http/http.dart' as http;
import 'package:v4s/models/preguntas_report.dart';
import 'package:v4s/models/preguntas_report_response.dart';
import 'package:v4s/models/preguntas_response.dart';

class PreguntasProvider extends ChangeNotifier{

  String _baseUrl = 'thonycertus.herokuapp.com';

  List<Pregunta> listaPreguntas = [];
  List<PreguntasReport> listaPreguntasReport = [];

  PreguntasProvider(){
    print('Ingresando a PreguntasProvider');
    this.getOnPreguntasList();
    this.reportePreguntas();
  }

  getOnPreguntasList() async {
    var url = Uri.http(_baseUrl, '/api/preguntas',{});
    final response = await http.get(url);
    print(response.body);
    final preguntaResponse = PreguntasResponse.fromJson(response.body);
    listaPreguntas = preguntaResponse.preguntas;
    notifyListeners();
  }
  
  savePreguntas(Pregunta preguntas) async {
    var url = Uri.http(_baseUrl, '/api/preguntas/save');
    print(preguntas.toJson());
    final response = await http.post(url,
                                      headers: {HttpHeaders.contentTypeHeader:'application/json'},
                                      body: preguntas.toJson());
    print(response.body);
    getOnPreguntasList();
    notifyListeners();
  }

  reportePreguntas() async {
    var url = Uri.http(_baseUrl, "/api/reportes/preguntasReport");
    final response = await http.get(url);
    final preguntasReportResponse = PreguntasReportResponse.fromJson(response.body);
    listaPreguntasReport = preguntasReportResponse.preguntasReport;
    notifyListeners();
  }

}