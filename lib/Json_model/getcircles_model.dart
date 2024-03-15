// To parse this JSON data, do
//
//     final getcirclesModel = getcirclesModelFromJson(jsonString);

import 'dart:convert';

GetcirclesModel getcirclesModelFromJson(String str) =>
    GetcirclesModel.fromJson(json.decode(str));

String getcirclesModelToJson(GetcirclesModel data) =>
    json.encode(data.toJson());

class GetcirclesModel {
  String? tel;
  Records? records;
  double? time;

  GetcirclesModel({
    this.tel,
    this.records,
    this.time,
  });

  factory GetcirclesModel.fromJson(Map<String, dynamic> json) =>
      GetcirclesModel(
        tel: json["tel"],
        records:
            json["records"] == null ? null : Records.fromJson(json["records"]),
        time: json["time"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "tel": tel,
        "records": records?.toJson(),
        "time": time,
      };
}

class Records {
  int? status;
  String? recordsOperator;
  String? segment;
  String? circle;
  String? comcircle;

  Records({
    this.status,
    this.recordsOperator,
    this.segment,
    this.circle,
    this.comcircle,
  });

  factory Records.fromJson(Map<String, dynamic> json) => Records(
        status: json["status"],
        recordsOperator: json["Operator"],
        segment: json["segment"],
        circle: json["circle"],
        comcircle: json["comcircle"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "Operator": recordsOperator,
        "segment": segment,
        "circle": circle,
        "comcircle": comcircle,
      };
}
