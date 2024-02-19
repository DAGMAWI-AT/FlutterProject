import 'package:flutter/material.dart';
import 'package:flutterproject/auth/sign_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterproject/config/colors.dart';
import 'package:flutterproject/screens/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: primaryColor,
        // scaffoldBackgroundColor: scaffoldBackgroundColor
      ),
      debugShowCheckedModeBanner: false,
      home: SignIn(),
    );
  }
}
