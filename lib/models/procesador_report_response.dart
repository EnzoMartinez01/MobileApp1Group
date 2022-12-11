import 'dart:convert';

import 'package:v4s/models/procesador_report.dart';

class ProcesadorsReportResponse {
  ProcesadorsReportResponse({
    required this.status,
    required this.productosReport,
  });

  String status;
  List<ProductosReport> productosReport;

  factory ProcesadorsReportResponse.fromJson(String str) =>
      ProcesadorsReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProcesadorsReportResponse.fromMap(Map<String, dynamic> json) =>
      ProcesadorsReportResponse(
        status: json["status"],
        productosReport: List<ProductosReport>.from(
            json["productosReport"].map((x) => ProductosReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "productosReport":
            List<dynamic>.from(productosReport.map((x) => x.toMap())),
      };
}
