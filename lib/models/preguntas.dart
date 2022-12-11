import 'dart:convert';

class Pregunta {
    Pregunta({
        required this.id,
        required this.preguntaId,
        required this.eleccion,
    });

    String id;
    int preguntaId;
    String eleccion;

    factory Pregunta.fromJson(String str) => Pregunta.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pregunta.fromMap(Map<String, dynamic> json) => Pregunta(
        id: json["_id"],
        preguntaId: json["preguntaId"],
        eleccion: json["eleccion"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "preguntaId": preguntaId,
        "eleccion": eleccion,
    };
}