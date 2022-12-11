import 'dart:convert';

import 'package:v4s/models/preguntas.dart';

class PreguntasResponse {
    PreguntasResponse({
        required this.preguntas,
    });

    List<Pregunta> preguntas;

    factory PreguntasResponse.fromJson(String str) => PreguntasResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PreguntasResponse.fromMap(Map<String, dynamic> json) => PreguntasResponse(
        preguntas: List<Pregunta>.from(json["preguntas"].map((x) => Pregunta.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "preguntas": List<dynamic>.from(preguntas.map((x) => x.toMap())),
    };
}