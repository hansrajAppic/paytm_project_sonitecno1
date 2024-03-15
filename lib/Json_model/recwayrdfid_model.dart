// To parse this JSON data, do
//
//     final requiredfieldModel = requiredfieldModelFromJson(jsonString);

import 'dart:convert';

RequiredfieldModel requiredfieldModelFromJson(String str) =>
    RequiredfieldModel.fromJson(json.decode(str));

String requiredfieldModelToJson(RequiredfieldModel data) =>
    json.encode(data.toJson());

class RequiredfieldModel {
  String? statuscode;
  String? status;
  List<TEXTFILD>? data;

  RequiredfieldModel({
    this.statuscode,
    this.status,
    this.data,
  });

  factory RequiredfieldModel.fromJson(Map<String, dynamic> json) =>
      RequiredfieldModel(
        statuscode: json["statuscode"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<TEXTFILD>.from(json["data"]!.map((x) => TEXTFILD.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class TEXTFILD {
  String? spkey;
  String? index;
  String? labels;
  int? fieldMinLen;
  int? fieldMaxLen;
  bool? isOptional;

  TEXTFILD({
    this.spkey,
    this.index,
    this.labels,
    this.fieldMinLen,
    this.fieldMaxLen,
    this.isOptional,
  });

  factory TEXTFILD.fromJson(Map<String, dynamic> json) => TEXTFILD(
        spkey: json["spkey"],
        index: json["index"],
        labels: json["Labels"],
        fieldMinLen: json["FieldMinLen"],
        fieldMaxLen: json["FieldMaxLen"],
        isOptional: json["IsOptional"],
      );

  Map<String, dynamic> toJson() => {
        "spkey": spkey,
        "index": index,
        "Labels": labels,
        "FieldMinLen": fieldMinLen,
        "FieldMaxLen": fieldMaxLen,
        "IsOptional": isOptional,
      };
}
