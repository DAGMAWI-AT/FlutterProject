import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/config/colors.dart';
import 'package:flutterproject/providers/review_cart_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  final String productName;
  final String productImage;
  final String productId;
  final int productQuantity;
  final int productPrice;

  Count({
    required this.productName,
    required this.productImage,
    required this.productId,
    required this.productPrice,
    required this.productQuantity,
  });

  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  late int count;
  bool isTrue = false;

  @override
  void initState() {
    super.initState();
    count = widget.productQuantity;
    getAddAndQuantity();
  }

  void getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("yourReviewCart")
        .doc(widget.productId)
        .get()
        .then(
          (value) => {
            if (this.mounted)
              {
                if (value.exists)
                  {
                    setState(() {
                      isTrue = value.get("isAdd");
                      count = value.get("cartQuantity");
                    })
                  }
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Container(
      height: 25,
      width: 50,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: isTrue == true
          ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    if (count > 1) {
                      setState(() {
                        count--;
                      });
                      reviewCartProvider.updateReviewCartData(
                          cartId: widget.productId,
                          cartName: widget.productName,
                          cartImage: widget.productImage,
                          cartPrice: widget.productPrice,
                          cartQuantity: count);
                    } else if (count == 1) {
                      setState(() {
                        count = 0;
                        isTrue = false;
                      });
                      reviewCartProvider.reviewCartDateDelete(widget.productId);
                    }
                  },
                  child: Icon(
                    Icons.remove,
                    size: 15,
                    color: Colors.orange,
                  ),
                ),
                Text(
                  '$count',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      count++;
                    });

                    reviewCartProvider.updateReviewCartData(
                        cartId: widget.productId,
                        cartName: widget.productName,
                        cartImage: widget.productImage,
                        cartPrice: widget.productPrice,
                        cartQuantity: count);
                  },
                  child: Icon(
                    Icons.add,
                    size: 15,
                    color: Colors.orange,
                  ),
                )
              ],
            )
          : Center(
              child: InkWell(
                onTap: () {
                  setState(() {
                    isTrue = true;
                    count = 1; // Set count to 1 when adding the item
                  });
                  reviewCartProvider.addReviewCartData(
                    cartId: widget.productId,
                    cartName: widget.productName,
                    cartImage: widget.productImage,
                    cartPrice: widget.productPrice,
                    cartQuantity: count,
                  );
                },
                child: Text("ADD", style: TextStyle(color: primaryColor)),
              ),
            ),
    );
  }
}
