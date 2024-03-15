// To parse this JSON data, do
//
//     final planREcharge = planREchargeFromJson(jsonString);

import 'dart:convert';

PlanREcharge planREchargeFromJson(String str) =>
    PlanREcharge.fromJson(json.decode(str));

String planREchargeToJson(PlanREcharge data) => json.encode(data.toJson());



class PlanREcharge {
  bool? success;
  Data? data;
  PlanREcharge({
    this.success,
    this.data,
  });

  factory PlanREcharge.fromJson(Map<String, dynamic> json) => PlanREcharge(
        success: json["success"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": data?.toJson(),
      };
}

class Data {
  List<Plan>? plans;

  Data({
    this.plans,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        plans: json["plans"] == null
            ? []
            : List<Plan>.from(json["plans"]!.map((x) => Plan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "plans": plans == null
            ? []
            : List<dynamic>.from(plans!.map((x) => x.toJson())),
      };
}

class Plan {
  String? id;
  int? operatorId;
  int? circleId;
  int? planType;
  dynamic planTab;
  String? planCode;
  int? amount;
  double? talktime;
  String? validity;
  PlanName? planName;
  String? planDescription;
  String? dataBenefit;
  int? isPopular;
  int? isPromoted;
  int? isHidden;
  String? stringTalktime;
  bool? special;
  int? validityInDays;
  List<String>? languageRegion;
  List<String>? type;
  int? planTypeForWeb;
  List<PlanDetailItemList>? planDetailItemList;
  List<int>? planTypeList;
  dynamic updatedOn;
  dynamic specialTag;
  dynamic specialTagBgColor;
  dynamic planBenefitItemList;

  Plan({
    this.id,
    this.operatorId,
    this.circleId,
    this.planType,
    this.planTab,
    this.planCode,
    this.amount,
    this.talktime,
    this.validity,
    this.planName,
    this.planDescription,
    this.dataBenefit,
    this.isPopular,
    this.isPromoted,
    this.isHidden,
    this.stringTalktime,
    this.special,
    this.validityInDays,
    this.languageRegion,
    this.type,
    this.planTypeForWeb,
    this.planDetailItemList,
    this.planTypeList,
    this.updatedOn,
    this.specialTag,
    this.specialTagBgColor,
    this.planBenefitItemList,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json["id"],
        operatorId: json["operatorId"],
        circleId: json["circleId"],
        planType: json["planType"],
        planTab: json["planTab"],
        planCode: json["planCode"],
        amount: json["amount"],
        talktime: json["talktime"]?.toDouble(),
        validity: json["validity"],
        planName: planNameValues.map[json["planName"]]!,
        planDescription: json["planDescription"],
        dataBenefit: json["dataBenefit"],
        isPopular: json["isPopular"],
        isPromoted: json["isPromoted"],
        isHidden: json["isHidden"],
        stringTalktime: json["stringTalktime"],
        special: json["special"],
        validityInDays: json["validityInDays"],
        languageRegion: json["languageRegion"] == null
            ? []
            : List<String>.from(json["languageRegion"]!.map((x) => x)),
        type: json["type"] == null
            ? []
            : List<String>.from(json["type"]!.map((x) => x)),
        planTypeForWeb: json["planTypeForWeb"],
        planDetailItemList: json["planDetailItemList"] == null
            ? []
            : List<PlanDetailItemList>.from(json["planDetailItemList"]!
                .map((x) => PlanDetailItemList.fromJson(x))),
        planTypeList: json["planTypeList"] == null
            ? []
            : List<int>.from(json["planTypeList"]!.map((x) => x)),
        updatedOn: json["updatedOn"],
        specialTag: json["specialTag"],
        specialTagBgColor: json["specialTagBgColor"],
        planBenefitItemList: json["planBenefitItemList"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "operatorId": operatorId,
        "circleId": circleId,
        "planType": planType,
        "planTab": planTab,
        "planCode": planCode,
        "amount": amount,
        "talktime": talktime,
        "validity": validity,
        "planName": planNameValues.reverse[planName],
        "planDescription": planDescription,
        "dataBenefit": dataBenefit,
        "isPopular": isPopular,
        "isPromoted": isPromoted,
        "isHidden": isHidden,
        "stringTalktime": stringTalktime,
        "special": special,
        "validityInDays": validityInDays,
        "languageRegion": languageRegion == null
            ? []
            : List<dynamic>.from(languageRegion!.map((x) => x)),
        "type": type == null ? [] : List<dynamic>.from(type!.map((x) => x)),
        "planTypeForWeb": planTypeForWeb,
        "planDetailItemList": planDetailItemList == null
            ? []
            : List<dynamic>.from(planDetailItemList!.map((x) => x.toJson())),
        "planTypeList": planTypeList == null
            ? []
            : List<dynamic>.from(planTypeList!.map((x) => x)),
        "updatedOn": updatedOn,
        "specialTag": specialTag,
        "specialTagBgColor": specialTagBgColor,
        "planBenefitItemList": planBenefitItemList,
      };
}

class PlanDetailItemList {
  Key? key;
  DisplayName? displayName;
  String? displayValue;

  PlanDetailItemList({
    this.key,
    this.displayName,
    this.displayValue,
  });

  factory PlanDetailItemList.fromJson(Map<String, dynamic> json) =>
      PlanDetailItemList(
        key: keyValues.map[json["key"]]!,
        displayName: displayNameValues.map[json["displayName"]]!,
        displayValue: json["displayValue"],
      );

  Map<String, dynamic> toJson() => {
        "key": keyValues.reverse[key],
        "displayName": displayNameValues.reverse[displayName],
        "displayValue": displayValue,
      };
}

enum DisplayName { DATA, TALKTIME, VALIDITY }

final displayNameValues = EnumValues({
  "Data": DisplayName.DATA,
  "Talktime": DisplayName.TALKTIME,
  "Validity": DisplayName.VALIDITY
});

enum Key { DATA, TALKTIME, VALIDITY }

final keyValues = EnumValues(
    {"data": Key.DATA, "talktime": Key.TALKTIME, "validity": Key.VALIDITY});

enum PlanName {
  THE_2_G_DATA,
  THE_3_G_DATA,
  THE_4_G_DATA,
  VOICE_3_G_DATA,
  VOICE_4_G_DATA,
  VOICE_TARIFF
}

final planNameValues = EnumValues({
  "2G Data": PlanName.THE_2_G_DATA,
  "3G Data": PlanName.THE_3_G_DATA,
  "4G Data": PlanName.THE_4_G_DATA,
  "Voice + 3G Data": PlanName.VOICE_3_G_DATA,
  "Voice + 4G Data": PlanName.VOICE_4_G_DATA,
  "Voice Tariff": PlanName.VOICE_TARIFF
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
