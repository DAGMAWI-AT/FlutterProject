// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutterproject/config/colors.dart';
import 'package:flutterproject/screens/home/drawer_side.dart';

class Profile extends StatelessWidget {
  Widget listTile({IconData? icon, required String title}) {
    return Column(
      children: [
        Divider(
          height: 1,
        ),
        ListTile(
          leading: Icon(icon),
          title: Text(title),
          trailing: Icon(Icons.arrow_forward_ios),
        )
      ],
    );
  }

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
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 100,
                  color: primaryColor,
                ),
                Container(
                  height: 548,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white, //scaffoldcolor
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 250,
                            height: 80,
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dagimawi Amare",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: textColor),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("amaredagmawi1@gmail.com")
                                  ],
                                ),
                                CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.green,
                                  child: CircleAvatar(
                                    radius: 12,
                                    child: Icon(Icons.edit,
                                        color: Color.fromARGB(255, 1, 61, 92)),
                                    backgroundColor: Color.fromARGB(
                                        255, 216, 212, 212), //scaffoldcollor
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      listTile(
                        icon: Icons.shop_outlined,
                        title: 'My Orders',
                      ),
                      listTile(
                        icon: Icons.location_on_outlined,
                        title: 'My Location',
                      ),
                      listTile(
                        icon: Icons.person_outlined,
                        title: 'Reffer A Frinds',
                      ),
                      listTile(
                        icon: Icons.file_copy_outlined,
                        title: 'Terms & Condition',
                      ),
                      listTile(
                        icon: Icons.policy_outlined,
                        title: 'Private Policy',
                      ),
                      listTile(
                        icon: Icons.add_chart,
                        title: 'About',
                      ),
                      listTile(
                        icon: Icons.exit_to_app_outlined,
                        title: 'Log Out',
                      ),
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 30),
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.green,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://dagmawiamare.netlify.app/assets/dagi-vVZ85jA3.png"),
                  radius: 45,
                  backgroundColor: Colors.grey,
                ),
              ),
            )
          ],
        ));
  }
}
