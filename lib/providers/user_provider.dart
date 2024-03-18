import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutterproject/models/user_model.dart';

class UserProvider with ChangeNotifier {
  void addUserData(
      {required User currentUser,
      required String userName,
      required String userImage,
      required String userEmail}) async {
    try {
      await FirebaseFirestore.instance
          .collection("usersData")
          .doc(currentUser.uid)
          .set(
        {
          "userName": userName,
          "userEmail": userEmail,
          "userImage": userImage,
          "userUid": currentUser.uid,
        },
      );
    } catch (error) {
      print("Error adding user data: $error");
      // Handle the error as needed, e.g., show an error message to the user.
    }
  }
}
