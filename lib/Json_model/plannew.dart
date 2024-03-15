// To parse this JSON data, do
//
//     final plannewModel = plannewModelFromJson(jsonString);

class Plans {
  String? id;
  int? operatorId;
  int? circleId;
  int? planType;
  String? planTab;
  String? planCode;
  double? amount;
  double? talktime;
  String? validity;
  String? planName;
  String? planDescription;
  String? dataBenefit;
  int? isPopular;
  int? isPromoted;
  int? isHidden;
  String? stringTalktime;
  bool? special;
  int? validityInDays;

  Plans({
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
  });

  factory Plans.fromJson(Map<String, dynamic> json) => Plans(
        id: json["id"],
        operatorId: json["operatorId"],
        circleId: json["circleId"],
        planType: json["planType"],
        // ignore: prefer_if_null_operators
        planTab: (json["planTab"] == null ? "" : json["planTab"])!,
        planCode: json["planCode"],
        amount: json["amount"],
        talktime: json["talktime"]?.toDouble(),
        validity: json["validity"],
        planName: json["planName"]!,
        planDescription: json["planDescription"],
        dataBenefit: json["dataBenefit"],
        isPopular: json["isPopular"],
        isPromoted: json["isPromoted"],
        isHidden: json["isHidden"],
        stringTalktime: json["stringTalktime"],
        special: json["special"],
        validityInDays: json["validityInDays"],
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
        "planName": planName,
        "planDescription": planDescription,
        "dataBenefit": dataBenefit,
        "isPopular": isPopular,
        "isPromoted": isPromoted,
        "isHidden": isHidden,
        "stringTalktime": stringTalktime,
        "special": special,
        "validityInDays": validityInDays,
      };
}

// 
