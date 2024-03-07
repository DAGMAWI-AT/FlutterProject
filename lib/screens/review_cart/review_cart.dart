import 'package:flutter/material.dart';
import 'package:flutterproject/config/colors.dart';
import 'package:flutterproject/models/review_cart_model.dart';
import 'package:flutterproject/providers/review_cart_provider.dart';
import 'package:flutterproject/widgets/single_item.dart';
import 'package:provider/provider.dart';

class ReviewCart extends StatelessWidget {
  const ReviewCart({super.key});

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "170 birr",
          style: TextStyle(
            color: Colors.green[900],
          ),
        ),
        trailing: Container(
          width: 100,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            onPressed: () {},
          ),
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
        backgroundColor: primaryColor,
      ),
      body: ListView.builder(
        itemCount: reviewCartProvider.getReviewCartDataList.length,
        itemBuilder: (context, index) {
          ReviewCartModel data =
              reviewCartProvider.getReviewCartDataList[index];
          return Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SingleItem(
                isBool: true,
                productImage: data.cartImage,
                productName: data.cartName,
                productPrice: data.cartPrice,
                productQuantity: data.cartQuantity,
                productId: data.cartId,
              ),
            ],
          );
        },
      ),
    );
  }
}
