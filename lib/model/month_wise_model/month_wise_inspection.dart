// To parse this JSON data, do
//
//     final inspectionMonthwiseModel = inspectionMonthwiseModelFromJson(jsonString);

import 'dart:convert';

InspectionMonthwiseModel inspectionMonthwiseModelFromJson(String str) => InspectionMonthwiseModel.fromJson(json.decode(str));

String inspectionMonthwiseModelToJson(InspectionMonthwiseModel data) => json.encode(data.toJson());

class InspectionMonthwiseModel {
    InspectionMonthwiseModel({
         this.code,
         this.data,
         this.success,
    });

    int? code;
    int? data;
    bool ?success;

    factory InspectionMonthwiseModel.fromJson(Map<String, dynamic> json) => InspectionMonthwiseModel(
        code: json["code"],
        data: json["data"],
        success: json["success"],
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "data": data,
        "success": success,
    };
}
