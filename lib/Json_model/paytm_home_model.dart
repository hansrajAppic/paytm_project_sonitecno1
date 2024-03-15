class homepaytemmodel {
  String? statuscode;
  String? status;
  List<LisrData>? data;

  homepaytemmodel({this.statuscode, this.status, this.data});

  homepaytemmodel.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <LisrData>[];
      json['data'].forEach((v) {
        data!.add(new LisrData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LisrData {
  int? iD;
  String? name;
  String? serviceID;
  bool? isActive;
  String? addDate;
  int? showPosition;
  String? cColor;
  String? bColor;
  bool? typeSection;
  String? serviceData;

  LisrData(
      {this.iD,
      this.name,
      this.serviceID,
      this.isActive,
      this.addDate,
      this.showPosition,
      this.cColor,
      this.bColor,
      this.typeSection,
      this.serviceData});

  LisrData.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    serviceID = json['ServiceID'];
    isActive = json['IsActive'];
    addDate = json['AddDate'];
    showPosition = json['ShowPosition'];
    cColor = json['CColor'];
    bColor = json['BColor'];
    typeSection = json['TypeSection'];
    serviceData = json['ServiceData'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['ServiceID'] = this.serviceID;
    data['IsActive'] = this.isActive;
    data['AddDate'] = this.addDate;
    data['ShowPosition'] = this.showPosition;
    data['CColor'] = this.cColor;
    data['BColor'] = this.bColor;
    data['TypeSection'] = this.typeSection;
    data['ServiceData'] = this.serviceData;
    return data;
  }

  removeSymbols(String s) {}
}
