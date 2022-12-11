import 'dart:convert';

class Usuario {
    Usuario({
        required this.id,
        required this.nombre,
        required this.apellidos,
        required this.correo,
        required this.sexo,
        required this.edad,
        required this.contra,
    });

    String id;
    String nombre;
    String apellidos;
    String correo;
    String sexo;
    int edad;
    String contra;

    factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["_id"],
        nombre: json["nombre"],
        apellidos: json["apellidos"],
        correo: json["correo"],
        sexo: json["sexo"],
        edad: json["edad"],
        contra: json["contraseña"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "nombre": nombre,
        "apellidos": apellidos,
        "correo": correo,
        "sexo": sexo,
        "edad": edad,
        "contraseña": contra,
    };
}
