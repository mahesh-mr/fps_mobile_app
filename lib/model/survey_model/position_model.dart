class PositionModel {
  int? code;
  Data? data;
  bool? success;

  PositionModel({this.code, this.data, this.success});

  PositionModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['success'] = this.success;
    return data;
  }
}

class Data {
  List<AllRoles>? allRoles;

  Data({this.allRoles});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['allRoles'] != null) {
      allRoles = <AllRoles>[];
      json['allRoles'].forEach((v) {
        allRoles!.add(new AllRoles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.allRoles != null) {
      data['allRoles'] = this.allRoles!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllRoles {
  int? id;
  String? role;

  AllRoles({this.id, this.role});

  AllRoles.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['role'] = this.role;
    return data;
  }
}
