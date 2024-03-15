class PlanValidate_model {
  String? code;
  String? status;
  String? mess;

  PlanValidate_model({this.code, this.status, this.mess});

  PlanValidate_model.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    mess = json['mess'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['status'] = this.status;
    data['mess'] = this.mess;
    return data;
  }
}
