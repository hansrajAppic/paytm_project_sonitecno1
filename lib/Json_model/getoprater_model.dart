class Getopretrs {
  String? statuscode;
  String? status;
  List<getopraterlist>? data;
  Getopretrs(String s, {required this.statuscode, this.status, this.data});

  Getopretrs.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <getopraterlist>[];
      json['data'].forEach((v) {
        data!.add(new getopraterlist.fromJson(v));
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

class getopraterlist {
  int? iD;
  String? operatorName;
  int? serviceID;
  String? operatorCode;
  String? img;

  getopraterlist(
      {this.iD,
      this.operatorName,
      this.serviceID,
      this.operatorCode,
      this.img});

  getopraterlist.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    operatorName = json['OperatorName'];
    serviceID = json['ServiceID'];
    operatorCode = json['OperatorCode'];
    img = json['Img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['OperatorName'] = this.operatorName;
    data['ServiceID'] = this.serviceID;
    data['OperatorCode'] = this.operatorCode;
    data['Img'] = this.img;
    return data;
  }
}
