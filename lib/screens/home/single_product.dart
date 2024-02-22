import 'package:flutter/material.dart';

class SingleProdduct extends StatelessWidget {
  final String productImage;
  final String productName;
  final Function? onTap;
  final int productPrice;
  const SingleProdduct(
      {required this.productImage,
      required this.productName,
      this.onTap,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            height: 230,
            width: 160,
            decoration: BoxDecoration(
                color: Color(0xffd9dad9),
                borderRadius: BorderRadius.circular(10)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              GestureDetector(
                onTap: onTap != null ? () => onTap!() : null,
                child: Container(
                  height: 150,
                  padding: EdgeInsets.all(5),
                  width: double.infinity,
                  child: Image.network(
                    productImage,
                  ),
                ),
              ),
              // Expanded(
              //   flex: 2,
              //   child: Image.network(
              //       fit: BoxFit.cover,
              //       'https://upload.wikimedia.org/wikipedia/commons/4/42/Vegetables_0006.JPG'),
              // ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        productName,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$productPrice birr',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(children: [
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.only(right: 1),
                                    height: 30,
                                    width: 50,
                                    child: MaterialButton(
                                      child: Row(children: [
                                        Expanded(
                                            child: Text(
                                          '1 KG',
                                          style: TextStyle(fontSize: 10),
                                        )),
                                        Center(
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            size: 10,
                                            color: Colors.blue,
                                          ),
                                        )
                                      ]),
                                      onPressed: () {},
                                    ),
                                  ),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: Container(
                              height: 25,
                              width: 50,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.remove,
                                    size: 15,
                                    color: Colors.orange,
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Icon(
                                    Icons.add,
                                    size: 15,
                                    color: Colors.orange,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
