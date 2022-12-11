import 'dart:convert';

import 'package:v4s/models/monitors.dart';

class MonitorsResponse {
  MonitorsResponse({
    required this.monitors,
  });

  List<Monitor> monitors;

  factory MonitorsResponse.fromJson(String str) =>
      MonitorsResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MonitorsResponse.fromMap(Map<String, dynamic> json) =>
      MonitorsResponse(
        monitors:
            List<Monitor>.from(json["monitors"].map((x) => Monitor.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "monitors": List<dynamic>.from(monitors.map((x) => x.toMap())),
      };
}
