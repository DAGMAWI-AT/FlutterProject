import 'package:flutter/material.dart';
import 'package:flutterproject/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterproject/config/colors.dart';
// import 'package:flutterproject/screens/home/home_screen.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutterproject/providers/product_provider.dart';
import 'package:flutterproject/providers/review_cart_provider.dart';
import 'package:flutterproject/providers/user_provider.dart';
import 'package:flutterproject/providers/wish_list_provider.dart';
// import 'package:flutterproject/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: primaryColor,
          // scaffoldBackgroundColor: scaffoldBackgroundColor
        ),
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
