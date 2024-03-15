class Getnewss {
  String? statuscode;
  String? status;
  List<getnewss>? data;

  Getnewss({this.statuscode, this.status, this.data});

  Getnewss.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <getnewss>[];
      json['data'].forEach((v) {
        data!.add(new getnewss.fromJson(v));
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

class getnewss {
  int? iD;
  String? name;
  String? description;
  // ignore: unnecessary_question_mark
  Null? image;
  bool? isActive;
  String? addDate;
  String? updateDate;
  int? msrno;
  int? companyID;
  String? status;

  getnewss(
      {this.iD,
      this.name,
      this.description,
      this.image,
      this.isActive,
      this.addDate,
      this.updateDate,
      this.msrno,
      this.companyID,
      this.status});

  getnewss.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    name = json['Name'];
    description = json['Description'];
    image = json['Image'];
    isActive = json['IsActive'];
    addDate = json['AddDate'];
    updateDate = json['UpdateDate'];
    msrno = json['Msrno'];
    companyID = json['CompanyID'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['Name'] = this.name;
    data['Description'] = this.description;
    data['Image'] = this.image;
    data['IsActive'] = this.isActive;
    data['AddDate'] = this.addDate;
    data['UpdateDate'] = this.updateDate;
    data['Msrno'] = this.msrno;
    data['CompanyID'] = this.companyID;
    data['Status'] = this.status;
    return data;
  }
}
