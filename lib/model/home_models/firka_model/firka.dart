// import 'dart:convert';

// FirkaModel firkaModelFromJson(String str) =>
//     FirkaModel.fromJson(json.decode(str));

// String firkaModelToJson(FirkaModel data) => json.encode(data.toJson());

// class FirkaModel {
//   FirkaModel({
//     this.status,
//     this.message,
//     this.data,
//   });

//   int? status;
//   String? message;
//   List<FirkaList>? data;

//   factory FirkaModel.fromJson(Map<String, dynamic> json) => FirkaModel(
//         status: json["status"],
//         message: json["message"],
//         data: List<FirkaList>.from(json["data"].map((x) => FirkaList.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "message": message,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//       };
// }

// class FirkaList {
//   FirkaList({
//     this.id,
//     this.name,
//     this.totalShops,
//     this.mappedShops,
//     this.districtId,
//     this.talukId,
//     this.createdAt,
//     this.updatedAt,
//   });

//   int? id;
//   String? name;
//   int? totalShops;
//   int? mappedShops;
//   int? districtId;
//   int? talukId;
//   DateTime? createdAt;
//   DateTime? updatedAt;

//   factory FirkaList.fromJson(Map<String, dynamic> json) => FirkaList(
//         id: json["id"],
//         name: json["name"],
//         totalShops: json["totalShops"],
//         mappedShops: json["mappedShops"],
//         districtId: json["districtId"],
//         talukId: json["talukId"],
//         createdAt: DateTime.parse(json["createdAt"]),
//         updatedAt: DateTime.parse(json["updatedAt"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "totalShops": totalShops,
//         "mappedShops": mappedShops,
//         "districtId": districtId,
//         "talukId": talukId,
//         "createdAt": createdAt!.toIso8601String(),
//         "updatedAt": updatedAt!.toIso8601String(),
//       };
// }


class FirkaModel {
  int? code;
  List<FirkaList>? data;
  bool? success;

  FirkaModel({this.code, this.data, this.success});

  FirkaModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    if (json['data'] != null) {
      data = <FirkaList>[];
      json['data'].forEach((v) {
        data!.add(new FirkaList.fromJson(v));
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

class FirkaList {
  int? id;
  String? name;
  int? districtId;
  int? talukId;

  FirkaList({this.id, this.name, this.districtId, this.talukId});

  FirkaList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    districtId = json['district_id'];
    talukId = json['taluk_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['district_id'] = this.districtId;
    data['taluk_id'] = this.talukId;
    return data;
  }
}
