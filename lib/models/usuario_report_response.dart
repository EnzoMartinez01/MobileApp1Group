import 'dart:convert';

import 'package:v4s/models/usuario_report.dart';

class UsuarioReportResponse {
  UsuarioReportResponse({
    required this.usuarioReport,
  });

  List<UsuarioReport> usuarioReport;

  factory UsuarioReportResponse.fromJson(String str) =>
      UsuarioReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UsuarioReportResponse.fromMap(Map<String, dynamic> json) =>
      UsuarioReportResponse(
        usuarioReport: List<UsuarioReport>.from(
            json["usuariosReport"].map((x) => UsuarioReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "usuarioReport":
            List<dynamic>.from(usuarioReport.map((x) => x.toMap())),
      };
}
