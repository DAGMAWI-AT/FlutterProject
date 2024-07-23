import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListProvider with ChangeNotifier {
  void updateWishListData({
    required String wishListId,
    required String wishListName,
    required String wishListImage,
    required int wishListPrice,
    required int wishListQuantity,
  }) async {
    try {
      await FirebaseFirestore.instance
          .collection("ReviewCart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection("YourReviewCart")
          .doc(wishListId)
          .update(
        {
          "cartId": wishListId,
          "cartName": wishListName,
          "cartImage": wishListImage,
          "cartPrice": wishListPrice,
          "cartQuantity": wishListQuantity,
          "wishList ": true,
        },
      );
    } catch (error) {
      print("Error update user data: $error");
      // Handle the error as needed, e.g., show an error message to the user.
    }
  }
}
