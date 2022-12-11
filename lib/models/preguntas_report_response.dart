import 'dart:convert';
import 'package:v4s/models/preguntas_report.dart';

class PreguntasReportResponse {
    PreguntasReportResponse({
        required this.preguntasReport,
    });

    List<PreguntasReport> preguntasReport;

    factory PreguntasReportResponse.fromJson(String str) => PreguntasReportResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PreguntasReportResponse.fromMap(Map<String, dynamic> json) => PreguntasReportResponse(
        preguntasReport: List<PreguntasReport>.from(json["preguntasReport"].map((x) => PreguntasReport.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "preguntasReport": List<dynamic>.from(preguntasReport.map((x) => x.toMap())),
    };
}