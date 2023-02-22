class ProfileModel {
  int? code;
  Data? data;
  bool? success;

  ProfileModel({this.code, this.data, this.success});

  ProfileModel.fromJson(Map<String, dynamic> json) {
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
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  int? penNo;
  int? phone;
  Role? role;
  District? district;
  District? taluk;
  District? firka;

  User(
      {this.id,
      this.name,
      this.email,
      this.penNo,
      this.phone,
      this.role,
      this.district,
      this.taluk,
      this.firka});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    penNo = json['pen_no'];
    phone = json['phone'];
    role = json['Role'] != null ? new Role.fromJson(json['Role']) : null;
    district = json['District'] != null
        ? new District.fromJson(json['District'])
        : null;
    taluk = json['Taluk'] != null ? new District.fromJson(json['Taluk']) : null;
    firka = json['Firka'] != null ? new District.fromJson(json['Firka']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['pen_no'] = this.penNo;
    data['phone'] = this.phone;
    if (this.role != null) {
      data['Role'] = this.role!.toJson();
    }
    if (this.district != null) {
      data['District'] = this.district!.toJson();
    }
    if (this.taluk != null) {
      data['Taluk'] = this.taluk!.toJson();
    }
    if (this.firka != null) {
      data['Firka'] = this.firka!.toJson();
    }
    return data;
  }
}

class Role {
  String? role;

  Role({this.role});

  Role.fromJson(Map<String, dynamic> json) {
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['role'] = this.role;
    return data;
  }
}

class District {
  String? name;

  District({this.name});

  District.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    return data;
  }
}
