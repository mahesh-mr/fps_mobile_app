class InspectorModel {
  String? name;
  String? role_id;
  // String? survey_id;
  InspectorModel({
    this.name,
    this.role_id,
    //this.survey_id,
  });
  @override
  String toString() {
    return '{ $name, $role_id, }';
  }
}

// class AcompanedModel {
//   int? code;
//   Data? data;
//   bool? success;

//   AcompanedModel({this.code, this.data, this.success});

//   AcompanedModel.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     success = json['success'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['success'] = this.success;
//     return data;
//   }
// }

// class Data {
//   List<AccompaniedList>? accompanied;

//   Data({this.accompanied});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['accompanied'] != null) {
//       accompanied = <AccompaniedList>[];
//       json['accompanied'].forEach((v) {
//         accompanied!.add(new AccompaniedList.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.accompanied != null) {
//       data['accompanied'] = this.accompanied!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class AccompaniedList {
//   int? id;
//   String? name;
//   int? surveyId;
//   int? roleId;
//   String? createdAt;
//   String? updatedAt;

//   AccompaniedList(
//       {this.id,
//       this.name,
//       this.surveyId,
//       this.roleId,
//       this.createdAt,
//       this.updatedAt});

//   AccompaniedList.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     surveyId = json['survey_id'];
//     roleId = json['role_id'];
//     createdAt = json['createdAt'];
//     updatedAt = json['updatedAt'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['survey_id'] = this.surveyId;
//     data['role_id'] = this.roleId;
//     data['createdAt'] = this.createdAt;
//     data['updatedAt'] = this.updatedAt;
//     return data;
//   }
// }
