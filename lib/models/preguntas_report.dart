import 'dart:convert';

class PreguntasReport {
    PreguntasReport({
        required this.id,
        required this.count,
    });

    String id;
    int count;

    factory PreguntasReport.fromJson(String str) => PreguntasReport.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory PreguntasReport.fromMap(Map<String, dynamic> json) => PreguntasReport(
        id: json["_id"],
        count: json["count"],
    );

    Map<String, dynamic> toMap() => {
        "_id": id,
        "count": count,
    };
}
