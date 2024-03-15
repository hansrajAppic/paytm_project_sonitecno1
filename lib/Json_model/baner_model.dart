class BannerHome {
  String? statuscode;
  String? status;
  List<BannerListData>? data;

  BannerHome({this.statuscode, this.status, this.data});

  BannerHome.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <BannerListData>[];
      json['data'].forEach((v) {
        data!.add(new BannerListData.fromJson(v));
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

class BannerListData {
  int? iD;
  String? imagePath;
  int? bannerTypeID;
  bool? isACtive;
  String? addDate;
  int? msrno;
  int? companyMemberID;
  String? name;

  BannerListData(
      {this.iD,
      this.imagePath,
      this.bannerTypeID,
      this.isACtive,
      this.addDate,
      this.msrno,
      this.companyMemberID,
      this.name});

  BannerListData.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    imagePath = json['ImagePath'];
    bannerTypeID = json['BannerTypeID'];
    isACtive = json['IsACtive'];
    addDate = json['AddDate'];
    msrno = json['Msrno'];
    companyMemberID = json['CompanyMemberID'];
    name = json['Name'];
  }

  get img => null;

  get serviceID => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ID'] = this.iD;
    data['ImagePath'] = this.imagePath;
    data['BannerTypeID'] = this.bannerTypeID;
    data['IsACtive'] = this.isACtive;
    data['AddDate'] = this.addDate;
    data['Msrno'] = this.msrno;
    data['CompanyMemberID'] = this.companyMemberID;
    data['Name'] = this.name;
    return data;
  }
}
