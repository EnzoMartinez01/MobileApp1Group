import 'dart:convert';

import 'package:v4s/models/carrito.dart';

class CarritosResponse {
    CarritosResponse({
        required this.carrito,
    });

    List<Carrito> carrito;

    factory CarritosResponse.fromJson(String str) => CarritosResponse.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CarritosResponse.fromMap(Map<String, dynamic> json) => CarritosResponse(
        carrito: List<Carrito>.from(json["carrito"].map((x) => Carrito.fromMap(x))),
    );

    Map<String, dynamic> toMap() => {
        "carrito": List<dynamic>.from(carrito.map((x) => x.toMap())),
    };
}
