// To parse this JSON data, do
//
//     final bbbpsoperator = bbbpsoperatorFromJson(jsonString);

import 'dart:convert';

Bbbpsoperator bbbpsoperatorFromJson(String str) =>
    Bbbpsoperator.fromJson(json.decode(str));

String bbbpsoperatorToJson(Bbbpsoperator data) => json.encode(data.toJson());

class Bbbpsoperator {
  String? statuscode;
  String? status;
  List<Datum>? data;

  Bbbpsoperator({
    this.statuscode,
    this.status,
    this.data,
  });

  factory Bbbpsoperator.fromJson(Map<String, dynamic> json) => Bbbpsoperator(
        statuscode: json["statuscode"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? name;
  String? id;
  String? datumClass;

  Datum({
    this.name,
    this.id,
    this.datumClass,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        name: json["Name"],
        id: json["ID"],
        datumClass: json["Class"],
      );

  Map<String, dynamic> toJson() => {
        "Name": name,
        "ID": id,
        "Class": datumClass,
      };

  toMap() {}
}
