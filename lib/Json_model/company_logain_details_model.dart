// ignore: unused_import

class CompanyData {
  String statuscode = "";
  String status = "";
  List<Dettilslist>? data;

  static var sendFormData;

  CompanyData({
    this.statuscode = "",
    this.status = "",
    this.data,
  });

  factory CompanyData.fromJson(Map<String, dynamic> json) => CompanyData(
        statuscode: json["statuscode"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Dettilslist>.from(
                json["data"]!.map((x) => Dettilslist.fromJson(x))),
      );

  get email => null;

  get fromJson => null;

  get name => null;

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Dettilslist {
  int? id;
  String? name;
  String? ownerName;
  String? email;
  String? alternateEmail;
  String? mobile;
  String? alternateMobile;
  String? websiteUrl;
  String? androidUrl;
  String? logo;
  String? address;
  String? copyright;
  bool? isActive;
  bool? isDelete;
  String? addDate;
  String? lastUpdate;
  String? faceBook;
  String? whastApp;
  String? instagram;
  String? twiter;
  String? youtube;
  String? bankName;
  String? acName;
  String? acType;
  String? acNumber;
  String? ifsc;
  String? micrCode;
  //Double? profileAmount;
  String? feviconicon;
  String? signature;
  int? memberId;
  String? bodyColor;
  String? leftColor;
  String? headerColor;

  Dettilslist({
    this.id,
    this.name,
    this.ownerName,
    this.email,
    this.alternateEmail,
    this.mobile,
    this.alternateMobile,
    this.websiteUrl,
    this.androidUrl,
    this.logo,
    this.address,
    this.copyright,
    this.isActive,
    this.isDelete,
    this.addDate,
    this.lastUpdate,
    this.faceBook,
    this.whastApp,
    this.instagram,
    this.twiter,
    this.youtube,
    this.bankName,
    this.acName,
    this.acType,
    this.acNumber,
    this.ifsc,
    this.micrCode,
    //this.profileAmount,
    this.feviconicon,
    this.signature,
    this.memberId,
    this.bodyColor,
    this.leftColor,
    this.headerColor,
  });

  factory Dettilslist.fromJson(Map<String, dynamic> json) => Dettilslist(
        id: json["ID"],
        name: json["Name"],
        ownerName: json["OwnerName"],
        email: json["Email"],
        alternateEmail: json["AlternateEmail"],
        mobile: json["Mobile"],
        alternateMobile: json["AlternateMobile"],
        websiteUrl: json["WebsiteURL"],
        androidUrl: json["AndroidURL"],
        logo: json["Logo"],
        address: json["Address"],
        copyright: json["Copyright"],
        isActive: json["IsActive"],
        isDelete: json["IsDelete"],
        addDate: json["AddDate"],
        lastUpdate: json["LastUpdate"],
        faceBook: json["FaceBook"],
        whastApp: json["WhastApp"],
        instagram: json["Instagram"],
        twiter: json["Twiter"],
        youtube: json["Youtube"],
        bankName: json["BankName"],
        acName: json["ACName"],
        acType: json["ACType"],
        acNumber: json["ACNumber"],
        ifsc: json["IFSC"],
        micrCode: json["MICRCode"],
        // profileAmount: json["ProfileAmount"],
        feviconicon: json["Feviconicon"],
        signature: json["signature"],
        memberId: json["MemberID"],
        bodyColor: json["BodyColor"],
        leftColor: json["LeftColor"],
        headerColor: json["HeaderColor"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "Name": name,
        "OwnerName": ownerName,
        "Email": email,
        "AlternateEmail": alternateEmail,
        "Mobile": mobile,
        "AlternateMobile": alternateMobile,
        "WebsiteURL": websiteUrl,
        "AndroidURL": androidUrl,
        "Logo": logo,
        "Address": address,
        "Copyright": copyright,
        "IsActive": isActive,
        "IsDelete": isDelete,
        "AddDate": addDate,
        "LastUpdate": lastUpdate,
        "FaceBook": faceBook,
        "WhastApp": whastApp,
        "Instagram": instagram,
        "Twiter": twiter,
        "Youtube": youtube,
        "BankName": bankName,
        "ACName": acName,
        "ACType": acType,
        "ACNumber": acNumber,
        "IFSC": ifsc,
        "MICRCode": micrCode,
        // "ProfileAmount": profileAmount,
        "Feviconicon": feviconicon,
        "signature": signature,
        "MemberID": memberId,
        "BodyColor": bodyColor,
        "LeftColor": leftColor,
        "HeaderColor": headerColor,
      };
}
