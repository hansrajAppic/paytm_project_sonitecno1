class Rechargerequest_model {
  String? statuscode;
  String? status;

  Rechargerequest_model({this.statuscode, this.status});

  Rechargerequest_model.fromJson(Map<String, dynamic> json) {
    statuscode = json['statuscode'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statuscode'] = this.statuscode;
    data['status'] = this.status;
    return data;
  }
}
