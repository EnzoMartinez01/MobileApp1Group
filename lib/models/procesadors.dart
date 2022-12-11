import 'dart:convert';

class Procesador {
  Procesador({
    required this.id,
    required this.idd,
    required this.descripcion,
    required this.imagen,
    required this.precio,
    required this.categoria,
  });

  String id;
  int idd;
  String descripcion;
  String imagen;
  int precio;
  String categoria;

  factory Procesador.fromJson(String str) =>
      Procesador.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Procesador.fromMap(Map<String, dynamic> json) => Procesador(
        id: json["_id"],
        idd: json["idd"],
        descripcion: json["descripcion"],
        precio: json["precio"],
        imagen: json["imagen"],
        categoria: json["categoria"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "idd": idd,
        "descripcion": descripcion,
        "precio": precio,
        "imagen": imagen,
        "categoria": categoria,
      };
}