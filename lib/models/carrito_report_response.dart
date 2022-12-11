

import 'dart:convert';

import 'carritoproducto.dart';

class CarritoReportResponse {
    CarritoReportResponse({
       required this.carritoReport,
    });

    List<CarritoReport> carritoReport;

    factory CarritoReportResponse.fromJson(String str) => CarritoReportResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CarritoReportResponse.fromMap(Map<String, dynamic> json) => CarritoReportResponse(
        carritoReport: List<CarritoReport>.from(json["carritoReport"].map((x) => CarritoReport.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "carritoReport": List<dynamic>.from(carritoReport.map((x) => x.toMap())),
    };
}