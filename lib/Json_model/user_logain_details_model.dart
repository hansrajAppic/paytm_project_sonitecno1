import 'dart:convert';
LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));
String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  String? statuscode;
  String? status;
  List<userData>? data;

  LoginData({
    this.statuscode,
    this.status,
    this.data,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        statuscode: json["statuscode"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<userData>.from(json["data"]!.map((x) => userData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "statuscode": statuscode,
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
    }

class userData {
  String? kycmessage;
  String? pan;
  String? aadhar;
  String? adddate;
  bool? isKycApproved;
  int? roleId;
  String? status;
  String? username;
  String? mobilenumber;
  String? usertype;
  int? packageId;
  int? wBalance;
  String? email;
  String? userid;
  String? loginPin;
  bool? isSystemOn;
  int? isAuthorized;
  String? userimage;
  bool? activeProfile;
  double? profileAmount;

  userData({
    this.kycmessage,
    this.pan,
    this.aadhar,
    this.adddate,
    this.isKycApproved,
    this.roleId,
    this.status,
    this.username,
    this.mobilenumber,
    this.usertype,
    this.packageId,
    this.wBalance,
    this.email,
    this.userid,
    this.loginPin,
    this.isSystemOn,
    this.isAuthorized,
    this.userimage,
    this.activeProfile,
    this.profileAmount,
  });

  factory userData.fromJson(Map<String, dynamic> json) => userData(
        kycmessage: json["kycmessage"],
        pan: json["Pan"],
        aadhar: json["Aadhar"],
        adddate: json["Adddate"],
        isKycApproved: json["IsKycApproved"],
        roleId: json["RoleID"],
        status: json["STATUS"],
        username: json["USERNAME"],
        mobilenumber: json["MOBILENUMBER"],
        usertype: json["USERTYPE"],
        packageId: json["PackageId"],
        wBalance: json["WBalance"],
        email: json["Email"],
        userid: json["USERID"],
        loginPin: json["LoginPin"],
        isSystemOn: json["IsSystemOn"],
        isAuthorized: json["IsAuthorized"],
        userimage: json["userimage"],
        activeProfile: json["ActiveProfile"],
        profileAmount: json["ProfileAmount"],
      );
  Map<String, dynamic> toJson() => {
        "kycmessage": kycmessage,
        "Pan": pan,
        "Aadhar": aadhar,
        "Adddate": adddate,
        "IsKycApproved": isKycApproved,
        "RoleID": roleId,
        "STATUS": status,
        "USERNAME": username,
        "MOBILENUMBER": mobilenumber,
        "USERTYPE": usertype,
        "PackageId": packageId,
        "WBalance": wBalance,
        "Email": email,
        "USERID": userid,
        "LoginPin": loginPin,
        "IsSystemOn": isSystemOn,
        "IsAuthorized": isAuthorized,
        "userimage": userimage,
        "ActiveProfile": activeProfile,
        "ProfileAmount": profileAmount,
      };
    }
