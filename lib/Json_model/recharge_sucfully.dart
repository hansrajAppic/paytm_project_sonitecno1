

// To parse this JSON data, do
//
//     final rechargesuccsfulyModel = rechargesuccsfulyModelFromJson(jsonString);

import 'dart:convert';

RechargesuccsfulyModel rechargesuccsfulyModelFromJson(String str) =>
    RechargesuccsfulyModel.fromJson(json.decode(str));

String rechargesuccsfulyModelToJson(RechargesuccsfulyModel data) =>
    json.encode(data.toJson());

class RechargesuccsfulyModel {
  String? statuscode;
  String? status;
  Data? data;

  RechargesuccsfulyModel({
    this.statuscode,
    this.status,
    this.data,
  });

  factory RechargesuccsfulyModel.fromJson(Map<String, dynamic> json) =>
      RechargesuccsfulyModel(
        statuscode: json["statuscode"],
        status: json["status"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "status": status,
        "data": data?.toJson(),
      };
}

class Data {
  String? status;
  String? message;
  String? number;
  String? amount;
  String? operatorname;
  String? rechargeStatus;
  String? transactionId;
  String? opid;
  String? balance;
  String? dateTime;

  Data({
    this.status,
    this.message,
    this.number,
    this.amount,
    this.operatorname,
    this.rechargeStatus,
    this.transactionId,
    this.opid,
    this.balance,
    this.dateTime,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        status: json["Status"],
        message: json["Message"],
        number: json["Number"],
        amount: json["Amount"],
        operatorname: json["OPERATORNAME"],
        rechargeStatus: json["RechargeStatus"],
        transactionId: json["TransactionID"],
        opid: json["OPID"],
        balance: json["Balance"],
        dateTime: json["DateTime"],
      );

  Map<String, dynamic> toJson() => {
        "Status": status,
        "Message": message,
        "Number": number,
        "Amount": amount,
        "OPERATORNAME": operatorname,
        "RechargeStatus": rechargeStatus,
        "TransactionID": transactionId,
        "OPID": opid,
        "Balance": balance,
        "DateTime": dateTime,
      };
}
