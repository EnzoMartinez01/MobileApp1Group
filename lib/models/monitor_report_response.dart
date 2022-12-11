import 'dart:convert';

import 'package:v4s/models/monitor_report.dart';

class MonitorsReportResponse {
  MonitorsReportResponse({
    required this.productosReport,
  });

  List<ProductosReport> productosReport;

  factory MonitorsReportResponse.fromJson(String str) =>
      MonitorsReportResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MonitorsReportResponse.fromMap(Map<String, dynamic> json) =>
      MonitorsReportResponse(
        productosReport: List<ProductosReport>.from(
            json["productosReport"].map((x) => ProductosReport.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "productosReport":
            List<dynamic>.from(productosReport.map((x) => x.toMap())),
      };
}
