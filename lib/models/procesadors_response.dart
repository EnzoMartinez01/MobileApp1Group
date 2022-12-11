import 'dart:convert';

import 'package:v4s/models/procesadors.dart';

class ProcesadorsResponse {
  ProcesadorsResponse({
    required this.procesadors,
  });

  List<Procesador> procesadors;

  factory ProcesadorsResponse.fromJson(String str) =>
      ProcesadorsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ProcesadorsResponse.fromMap(Map<String, dynamic> json) =>
      ProcesadorsResponse(
        procesadors: List<Procesador>.from(
            json["procesadors"].map((x) => Procesador.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "procesadors": List<dynamic>.from(procesadors.map((x) => x.toMap())),
      };
}
