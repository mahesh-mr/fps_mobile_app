// class AllFpsNumberModel {
//   int? status;
//   String? message;
//   List<FPSNumber>? data;

//   AllFpsNumberModel({this.status, this.message, this.data});

//   AllFpsNumberModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['data'] != null) {
//       data = <FPSNumber>[];
//       json['data'].forEach((v) {
//         data!.add(new FPSNumber.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class FPSNumber {
//   int? id;
//   int? fpsNo;

//   FPSNumber({this.id, this.fpsNo});

//   FPSNumber.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fpsNo = json['fps_no'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['fps_no'] = this.fpsNo;
//     return data;
//   }
// }
class AllFpsNumberModel {
  int? status;
  String? message;
  List<FPSNumber>? data;

  AllFpsNumberModel({this.status, this.message, this.data});

  AllFpsNumberModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <FPSNumber>[];
      json['data'].forEach((v) {
        data!.add(new FPSNumber.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FPSNumber {
  int? id;
  int? fpsNo;
  int? firka;

  FPSNumber({this.id, this.fpsNo, this.firka});

  FPSNumber.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fpsNo = json['fps_no'];
    firka = json['firka'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fps_no'] = this.fpsNo;
    data['firka'] = this.firka;
    return data;
  }
}
