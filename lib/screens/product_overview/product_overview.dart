import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterproject/providers/wish_list_provider.dart';
import 'package:provider/provider.dart';
// import 'package:flutterproject/config/colors.dart';

enum SinginCharacter { fill, outline }

class ProductOverview extends StatefulWidget {
  // const ProductOverview({super.key});
  final String productName;
  final String productImage;
  final int productPrice;
  ProductOverview({
    required this.productImage,
    required this.productName,
    required this.productPrice,
  });

  @override
  _ProductOverviewState createState() => _ProductOverviewState();
}

class _ProductOverviewState extends State<ProductOverview> {
  // ignore: unused_field
  SinginCharacter _character = SinginCharacter.fill;

  Widget bottomNavigatorBar({
    Color iconColor = const Color.fromARGB(255, 0, 0, 0),
    Color backgroundColor = const Color.fromARGB(255, 248, 172, 8),
    Color color = Colors.black87,
    String title = "overview",
    IconData iconData = Icons.favorite_outline,
    required Function() onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.all(20),
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                size: 20,
                color: iconColor,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                title,
                style: TextStyle(color: Colors.black45),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool wishListBool = false;
  @override
  Widget build(BuildContext context) {
    WishListProvider wishListProvider = Provider.of(context);
    return Scaffold(
        bottomNavigationBar: Row(children: [
          bottomNavigatorBar(
            backgroundColor: Colors.orange,
            color: Color.fromARGB(255, 5, 3, 0),
            iconColor: Colors.black,
            title: "add to whislist",
            iconData:
                wishListBool == false ? Icons.favorite_outline : Icons.favorite,
            onTap: () {
              setState(() {
                wishListBool = !wishListBool;
              });
            },
          ),
          bottomNavigatorBar(
            backgroundColor: Colors.green,
            color: Colors.white70,
            iconColor: Colors.grey,
            title: "go to chart",
            iconData: Icons.shop_outlined,
            onTap: () {
              setState(() {
                wishListBool = !wishListBool;
              });
            },
          ),
        ]),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black45),
          title: Text(
            "Product Overview",
            style: TextStyle(
              color: Colors.black45,
              // backgroundColor: Color(0xffd6b738),
            ),
          ),
          backgroundColor: Color(0xffd6b738),
        ),
        body: Column(children: [
          Expanded(
              flex: 2,
              child: Container(
                width: double.infinity,
                child: Column(children: [
                  ListTile(
                      title: Text(widget.productName),
                      subtitle: Text("50 birr")),
                  Container(
                    height: 250,
                    padding: EdgeInsets.all(40),
                    child: Image.network(
                        // "https://upload.wikimedia.org/wikipedia/commons/4/42/Vegetables_0006.JPG"
                        widget.productImage),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.infinity,
                    child: Text(
                      "available Option",
                      style: TextStyle(
                        color: Colors.black45,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 3,
                              backgroundColor: Colors.green[700],
                            ),
                            Radio(
                              value: SinginCharacter.fill,
                              activeColor: Colors.green[700],
                              onChanged: (value) {
                                setState(() {
                                  _character = value!;
                                });
                              },
                              groupValue: SinginCharacter.fill,
                            ),
                          ],
                        ),
                        Text("\ ${widget.productPrice} Birr"),
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 17,
                                color: Colors.orange,
                              ),
                              Text(
                                "ADD",
                                style: TextStyle(color: Colors.orange),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              )),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About this product",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "About this product description ajkoilrkqjaioklhdnfiuailkhrgnjakdnl",
                    style: TextStyle(fontSize: 16, color: Colors.black45),
                  )
                ],
              ),
            ),
          )
        ]));
  }
}
