// ignore_for_file: invalid_use_of_protected_member

import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:fps/controller/controller/qustion_pagae_controller/qustion_controller.dart';
import 'package:fps/controller/controller/survey_controller/position_controller.dart';
import 'package:fps/controller/service/dioclint/token/token.dart';
import 'package:fps/model/qustion_model.dart';
import 'package:fps/view/screens/dialogs/privacy_policy.dart';
import 'package:fps/view/screens/navebar_screen/navbar.dart';
import 'package:fps/view/screens/screen%20_login/login_screen.dart';
import 'package:fps/view/style/style.dart';
import 'package:get/get.dart';

class Popups extends StatelessWidget {
  Popups({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  // final positionController = Get.put(PositionController());
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.menu,
        color: color,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(value: 0, child: Text("Privacy Policy")),
        const PopupMenuItem(value: 1, child: Text("Terms & Conditions")),
        // const PopupMenuItem(value: 2, child: Text("Log Out")),
      ],
      color: white,
      elevation: 2,
      onSelected: (value) {
        if (value == 0) {
          Get.to(PrivacyPolicyScreen(
              mdFilename: 'privacy_policy.md',
              image: 'assets/privacy.png',
              title: 'Privacy Policy'));
        }
        if (value == 1) {
          Get.to(PrivacyPolicyScreen(
              mdFilename: 'terms.md',
              image: 'assets/terms.png',
              title: 'Terms &\nConditions'));
        }
      },
    );
  }
}

class PopupHome extends StatelessWidget {
  PopupHome({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  String? token = GetLocalStorage.getUserIdAndToken('token');

  Future<void> _clearCache() async {
    await DefaultCacheManager().emptyCache();
  }

  String? userId = GetLocalStorage.getUserIdAndToken('id');
  final positionController = Get.put(PositionController());
  @override
  Widget build(BuildContext context) {
    final storageController = Get.put(GetLocalStorage());
    return PopupMenuButton<int>(
      icon: Icon(
        Icons.menu,
        color: color,
      ),
      itemBuilder: (context) => [
        const PopupMenuItem(value: 0, child: Text("Privacy Policy")),
        const PopupMenuItem(value: 1, child: Text("Terms & Conditions")),
        const PopupMenuItem(value: 2, child: Text("Log Out")),
      ],
      color: white,
      elevation: 2,
      onSelected: (value) {
        if (value == 0) {
          Get.to(PrivacyPolicyScreen(
              mdFilename: 'privacy_policy.md',
              image: 'assets/privacy.png',
              title: 'Privacy Policy'));
        }
        if (value == 1) {
          Get.to(PrivacyPolicyScreen(
              mdFilename: 'terms.md',
              image: 'assets/terms.png',
              title: 'Terms &\nConditions'));
        } else if (value == 2) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Log out of FPS?"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      _clearCache();
                      positionController.switchValue.value = false;
                      print("$userId  ==== id 666");
                      print("1");
                      storageController.removeUserremovedSId();

                      print("$userId  ==== token 666");

                      Future.delayed(Duration(microseconds: 30)).then(
                          (value) => storageController.removeUserTokenAndUid());
                      qustionsList = qustionsList
                          .map((e) => QustionModel(
                              text: e.text,
                              headaLine: e.headaLine,
                              bar: e.bar,
                              number: e.number))
                          .toList();

                      Future.delayed(Duration(seconds: 1))
                          .then((value) => Get.offAll(LoginScreen()));
                    },
                    child: const Text(
                      "Logout",
                      style: TextStyle(
                        color: red,
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        }
      },
    );
  }
}
