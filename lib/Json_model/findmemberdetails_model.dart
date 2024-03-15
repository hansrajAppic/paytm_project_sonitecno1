class findmemberdetails_model {
  String? statuscode;
  String? status;
  List<UserDetails>? data;

  findmemberdetails_model({this.statuscode, this.status, this.data});

  findmemberdetails_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
    if (json['data'] != null) {
      data = <UserDetails>[];
      json['data'].forEach((v) {
        data!.add(new UserDetails.fromJson(v));
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

class UserDetails {
  String? name;
  String? loginID;
  String? email;

  UserDetails({this.name, this.loginID, this.email});

  UserDetails.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    loginID = json['LoginID'];
    email = json['Email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Name'] = this.name;
    data['LoginID'] = this.loginID;
    data['Email'] = this.email;
    return data;
  }
}
