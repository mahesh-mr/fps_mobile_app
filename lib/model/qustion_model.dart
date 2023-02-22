import 'package:flutter/material.dart';

class QustionModel {
  String text;
  String? headaLine;
  double bar;
  int number;
  bool? isSelectedYes;
  bool isSubmited;

  QustionModel({
    required this.text,
    this.headaLine,
    required this.bar,
    required this.number,
    this.isSelectedYes,
    this.isSubmited=false,
   
  });
}
