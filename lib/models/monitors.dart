import 'dart:convert';

class Monitor {
  Monitor({
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
  int precio;
  String imagen;
  String categoria;

  factory Monitor.fromJson(String str) => Monitor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Monitor.fromMap(Map<String, dynamic> json) => Monitor(
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
