// To parse this JSON data, do
//
//     final getbanklisModel = getbanklisModelFromJson(jsonString);

import 'dart:convert';

GetbanklisModel getbanklisModelFromJson(String str) =>
    GetbanklisModel.fromJson(json.decode(str));

String getbanklisModelToJson(GetbanklisModel data) =>
    json.encode(data.toJson());

class GetbanklisModel {
  String? statuscode;
  String? status;
  List<GetbankList>? data;

  GetbanklisModel({
    this.statuscode,
    this.status,
    this.data,
  });

  factory GetbanklisModel.fromJson(Map<String, dynamic> json) =>
      GetbanklisModel(
        statuscode: json["statuscode"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<GetbankList>.from(json["data"]!.map((x) => GetbankList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class GetbankList {
  int? id;
  String? name;
  String? ifsc;
  String? class1;
  bool? isDelete;
  bool? isActive;
  String? createdDate;
  dynamic updatedDate;
  String? img;

  GetbankList({
    this.id,
    this.name,
    this.ifsc,
    this.class1,
    this.isDelete,
    this.isActive,
    this.createdDate,
    this.updatedDate,
    this.img,
  });

  factory GetbankList.fromJson(Map<String, dynamic> json) => GetbankList(
        id: json["ID"],
        name: json["Name"],
        ifsc: json["IFSC"],
        class1: json["class1"],
        isDelete: json["IsDelete"],
        isActive: json["IsActive"],
        createdDate: json["CreatedDate"],
        updatedDate: json["UpdatedDate"],
        img: json["Img"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "IFSC": ifsc,
        "class1": class1,
        "IsDelete": isDelete,
        "IsActive": isActive,
        "CreatedDate": createdDate,
        "UpdatedDate": updatedDate,
        "Img": img,
      };
}
