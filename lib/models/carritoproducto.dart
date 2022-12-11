import 'dart:convert';
class CarritoReport {
    CarritoReport({
         required this.id,
        required this.count,
    });

    dynamic id;
    int count;

    factory CarritoReport.fromJson(String str) => CarritoReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CarritoReport.fromMap(Map<String, dynamic> json) => CarritoReport(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}
