// 

class TalukModel {
  int? code;
  List<Taluk>? data;
  bool? success;

  TalukModel({this.code, this.data, this.success});

  TalukModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <Taluk>[];
      json['data'].forEach((v) {
        data!.add(new Taluk.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class Taluk {
  int? id;
  String? name;
  int? districtId;

  Taluk({this.id, this.name, this.districtId});

  Taluk.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    districtId = json['district_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['district_id'] = this.districtId;
    return data;
  }
}
