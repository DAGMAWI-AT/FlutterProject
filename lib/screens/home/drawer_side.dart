import 'package:flutter/material.dart';
import 'package:flutterproject/screens/profile/profile.dart';
import 'package:flutterproject/screens/review_cart/review_cart.dart';

class DrawerSide extends StatelessWidget {
  Widget listTile(
      {required IconData icon,
      required String title,
      required Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title,
        style: TextStyle(color: Colors.black.withOpacity(0.45)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.green,
        child: ListView(
          children: [
            DrawerHeader(
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white54,
                    radius: 43,
                    child: CircleAvatar(
                      backgroundColor: Colors.orange,
                      radius: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('welcome Dagu'),
                      SizedBox(
                        height: 7,
                      ),
                      Container(
                        height: 30,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Text('Login'),
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            side: BorderSide(width: 2),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            listTile(icon: Icons.home_outlined, title: "Home", onTap: () {}),
            listTile(
                icon: Icons.shop_outlined,
                title: "Cart",
                onTap: () {
                  return Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ReviewCart(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.person_outlined,
                title: "Profile",
                onTap: () {
                  return Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Profile(),
                    ),
                  );
                }),
            listTile(
                icon: Icons.notifications_outlined,
                title: "Notifcation",
                onTap: () {}),
            listTile(icon: Icons.star_outlined, title: "Rating", onTap: () {}),
            listTile(
                icon: Icons.favorite_outlined, title: "Wishlist", onTap: () {}),
            listTile(icon: Icons.copy_outlined, title: "Raise", onTap: () {}),
            listTile(
                icon: Icons.format_quote_outlined, title: "FAQs", onTap: () {}),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Contact Support"),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text("Call Us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("+251 985187059"),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    SingleChildScrollView(
                      child: Row(
                        children: [
                          Text("Email Us:"),
                          SizedBox(
                            width: 10,
                          ),
                          Text("amaredagmawi1@gmail.com"),
                        ],
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
