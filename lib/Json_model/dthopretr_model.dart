class DthOperators {
  String? statuscode;
  String? status;
  List<Dthlist>? data;

  DthOperators({this.statuscode, this.status, this.data});

  DthOperators.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Dthlist>[];
      json['data'].forEach((v) {
        data!.add(new Dthlist.fromJson(v));
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

class Dthlist {
  String? kycmessage;
  String? pan;
  String? aadhar;
  String? adddate;
  bool? isKycApproved;
  int? roleID;
  String? sTATUS;
  String? uSERNAME;
  String? mOBILENUMBER;
  String? uSERTYPE;
  int? packageId;
  int? wBalance;
  String? email;
  String? uSERID;
  String? loginPin;
  bool? isSystemOn;
  int? isAuthorized;
  String? userimage;
  bool? activeProfile;
  int? profileAmount;

  Dthlist(
      {this.kycmessage,
      this.pan,
      this.aadhar,
      this.adddate,
      this.isKycApproved,
      this.roleID,
      this.sTATUS,
      this.uSERNAME,
      this.mOBILENUMBER,
      this.uSERTYPE,
      this.packageId,
      this.wBalance,
      this.email,
      this.uSERID,
      this.loginPin,
      this.isSystemOn,
      this.isAuthorized,
      this.userimage,
      this.activeProfile,
      this.profileAmount});
  Dthlist.fromJson(Map<String, dynamic> json) {
    kycmessage = json['kycmessage'];
    pan = json['Pan'];
    aadhar = json['Aadhar'];
    adddate = json['Adddate'];
    isKycApproved = json['IsKycApproved'];
    roleID = json['RoleID'];
    sTATUS = json['STATUS'];
    uSERNAME = json['USERNAME'];
    mOBILENUMBER = json['MOBILENUMBER'];
    uSERTYPE = json['USERTYPE'];
    packageId = json['PackageId'];
    wBalance = json['WBalance'];
    email = json['Email'];
    uSERID = json['USERID'];
    loginPin = json['LoginPin'];
    isSystemOn = json['IsSystemOn'];
    isAuthorized = json['IsAuthorized'];
    userimage = json['userimage'];
    activeProfile = json['ActiveProfile'];
    profileAmount = json['ProfileAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['kycmessage'] = this.kycmessage;
    data['Pan'] = this.pan;
    data['Aadhar'] = this.aadhar;
    data['Adddate'] = this.adddate;
    data['IsKycApproved'] = this.isKycApproved;
    data['RoleID'] = this.roleID;
    data['STATUS'] = this.sTATUS;
    data['USERNAME'] = this.uSERNAME;
    data['MOBILENUMBER'] = this.mOBILENUMBER;
    data['USERTYPE'] = this.uSERTYPE;
    data['PackageId'] = this.packageId;
    data['WBalance'] = this.wBalance;
    data['Email'] = this.email;
    data['USERID'] = this.uSERID;
    data['LoginPin'] = this.loginPin;
    data['IsSystemOn'] = this.isSystemOn;
    data['IsAuthorized'] = this.isAuthorized;
    data['userimage'] = this.userimage;
    data['ActiveProfile'] = this.activeProfile;
    data['ProfileAmount'] = this.profileAmount;
    return data;
  }
}
