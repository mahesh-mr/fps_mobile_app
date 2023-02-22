// 
class DistrictModel {
  int? code;
  List<AllDistrict>? data;
  bool? success;

  DistrictModel({this.code, this.data, this.success});

  DistrictModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <AllDistrict>[];
      json['data'].forEach((v) {
        data!.add(new AllDistrict.fromJson(v));
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

class AllDistrict {
  int? id;
  String? name;

  AllDistrict({this.id, this.name});

  AllDistrict.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
