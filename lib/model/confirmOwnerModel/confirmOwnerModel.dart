// ignore: file_names
class ComfirmModel {
  int? status;
  String? message;
  Data? data;

  ComfirmModel({this.status, this.message, this.data});

  ComfirmModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? licenseeName;
  int? phoneNo;
  String? address;
  Null? emailId;
  String? fatherName;
  Null? spouseName;
  Null? occupation;
  Null? education;
  String? aadharNo;
  int? maritalStatus;
  String? dob;
  String? dateOfAgreement;
  int? fpsNo;
  int? fpsStatus;
  int? membershipId;
  Null? memType;
  int? districtId;
  int? talukId;
  int? firka;
  String? nomineeName;
  String? nomineeAddress;
  int? nomineeMobNo;
  String? nomineeAadharNo;
  String? nameSalesman;
  String? addressOfSalesManWomen;
  int? phNoSalesman;
  String? secuityDpst;
  String? totalService;
  String? dateDeposit;
  String? relWithDealer;
  int? type;
  int? status;
  String? salesAadharNo;
  String? nomineeDOB;
  String? subscriptionRemittedDate;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.licenseeName,
      this.phoneNo,
      this.address,
      this.emailId,
      this.fatherName,
      this.spouseName,
      this.occupation,
      this.education,
      this.aadharNo,
      this.maritalStatus,
      this.dob,
      this.dateOfAgreement,
      this.fpsNo,
      this.fpsStatus,
      this.membershipId,
      this.memType,
      this.districtId,
      this.talukId,
      this.firka,
      this.nomineeName,
      this.nomineeAddress,
      this.nomineeMobNo,
      this.nomineeAadharNo,
      this.nameSalesman,
      this.addressOfSalesManWomen,
      this.phNoSalesman,
      this.secuityDpst,
      this.totalService,
      this.dateDeposit,
      this.relWithDealer,
      this.type,
      this.status,
      this.salesAadharNo,
      this.nomineeDOB,
      this.subscriptionRemittedDate,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    licenseeName = json['licenseeName'];
    phoneNo = json['phone_no'];
    address = json['address'];
    emailId = json['email_id'];
    fatherName = json['father_name'];
    spouseName = json['spouse_name'];
    occupation = json['occupation'];
    education = json['education'];
    aadharNo = json['aadhar_no'];
    maritalStatus = json['marital_status'];
    dob = json['dob'];
    dateOfAgreement = json['date_of_agreement'];
    fpsNo = json['fps_no'];
    fpsStatus = json['fps_status'];
    membershipId = json['membership_id'];
    memType = json['mem_type'];
    districtId = json['districtId'];
    talukId = json['talukId'];
    firka = json['firka'];
    nomineeName = json['nominee_name'];
    nomineeAddress = json['nominee_address'];
    nomineeMobNo = json['nominee_mob_no'];
    nomineeAadharNo = json['nominee_aadhar_no'];
    nameSalesman = json['name_salesman'];
    addressOfSalesManWomen = json['address_of_sales_man_women'];
    phNoSalesman = json['ph_no_salesman'];
    secuityDpst = json['secuity_dpst'];
    totalService = json['total_service'];
    dateDeposit = json['date_deposit'];
    relWithDealer = json['relWithDealer'];
    type = json['type'];
    status = json['status'];
    salesAadharNo = json['sales_aadhar_no'];
    nomineeDOB = json['nominee_DOB'];
    subscriptionRemittedDate = json['subscriptionRemittedDate'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['licenseeName'] = this.licenseeName;
    data['phone_no'] = this.phoneNo;
    data['address'] = this.address;
    data['email_id'] = this.emailId;
    data['father_name'] = this.fatherName;
    data['spouse_name'] = this.spouseName;
    data['occupation'] = this.occupation;
    data['education'] = this.education;
    data['aadhar_no'] = this.aadharNo;
    data['marital_status'] = this.maritalStatus;
    data['dob'] = this.dob;
    data['date_of_agreement'] = this.dateOfAgreement;
    data['fps_no'] = this.fpsNo;
    data['fps_status'] = this.fpsStatus;
    data['membership_id'] = this.membershipId;
    data['mem_type'] = this.memType;
    data['districtId'] = this.districtId;
    data['talukId'] = this.talukId;
    data['firka'] = this.firka;
    data['nominee_name'] = this.nomineeName;
    data['nominee_address'] = this.nomineeAddress;
    data['nominee_mob_no'] = this.nomineeMobNo;
    data['nominee_aadhar_no'] = this.nomineeAadharNo;
    data['name_salesman'] = this.nameSalesman;
    data['address_of_sales_man_women'] = this.addressOfSalesManWomen;
    data['ph_no_salesman'] = this.phNoSalesman;
    data['secuity_dpst'] = this.secuityDpst;
    data['total_service'] = this.totalService;
    data['date_deposit'] = this.dateDeposit;
    data['relWithDealer'] = this.relWithDealer;
    data['type'] = this.type;
    data['status'] = this.status;
    data['sales_aadhar_no'] = this.salesAadharNo;
    data['nominee_DOB'] = this.nomineeDOB;
    data['subscriptionRemittedDate'] = this.subscriptionRemittedDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
