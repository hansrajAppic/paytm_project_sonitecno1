class fundtransfer_model {
  String? statuscode;
  String? status;

  fundtransfer_model({this.statuscode, this.status});

  fundtransfer_model.fromJson(Map<String, dynamic> json) {
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
