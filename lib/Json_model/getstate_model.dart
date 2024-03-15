class Getstate_model {
  bool? status;
  int? responseCode;
  List<Banklist>? banklist;

  Getstate_model({this.status, this.responseCode, this.banklist});

  Getstate_model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    responseCode = json['response_code'];
    if (json['banklist'] != null) {
      banklist = <Banklist>[];
      json['banklist'].forEach((v) {
        banklist!.add(new Banklist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['response_code'] = this.responseCode;
    if (this.banklist != null) {
      data['banklist'] = this.banklist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Banklist {
  int? id;
  String? statename;
  int? stateId;

  Banklist({this.id, this.statename, this.stateId});

  Banklist.fromJson(Map<String, dynamic> json) {
    id = json['ID'];
    statename = json['StateName'];
    stateId = json['CircleCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['statename'] = this.statename;
    data['stateId'] = this.stateId;
    return data;
  }
}
