import 'package:flutter/material.dart';
import 'package:flutterproject/config/colors.dart';
import 'package:flutterproject/screens/home/drawer_side.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            color: textColor,
          ),
        ),
        backgroundColor: primaryColor,
      ),
      drawer: DrawerSide(),
    );
  }
}
