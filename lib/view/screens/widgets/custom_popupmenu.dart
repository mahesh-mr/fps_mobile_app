
import 'package:flutter/material.dart';

class PopupmenuButtonWidgets extends StatelessWidget {
  PopupmenuButtonWidgets({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;

  List<String> popupItems = ["Privacy Policy", "Terms & Conditions", 'Log Out'];

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: Icon(
        Icons.menu,
        color: color,
      ),
      itemBuilder: (context) => popupItems
          .map((e) => PopupMenuItem<String>(value: e, child: Text(e)))
          .toList(),
      onSelected: (value) {
        switch (value) {
          case "Privacy Policy":
          
            break;
          case "Terms & Conditions":
            break;
          case "Log Out":
            break;
          default:
            'version';
        }
      },
    );
  }
}
