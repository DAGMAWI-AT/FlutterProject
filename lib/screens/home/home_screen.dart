// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutterproject/providers/product_provider.dart';
import 'package:flutterproject/screens/home/drawer_side.dart';
import 'package:flutterproject/screens/product_overview/product_overview.dart';
import 'package:flutterproject/screens/home/single_product.dart';
import 'package:flutterproject/screens/search/search.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductProvider productProvider = ProductProvider();
  // Initialize your provider

  Widget _buildHerbsProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Herbs Seasuogis'),
              Text(
                'View all',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getHerbsProductDataList.map(
              (herbsProductData) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productPrice: herbsProductData.productPrice,
                          productName: herbsProductData.productName,
                          productImage: herbsProductData.productImage,
                        ),
                      ),
                    );
                  },
                  child: SingleProdduct(
                    productPrice: herbsProductData.productPrice,
                    productImage: herbsProductData.productImage,
                    productName: herbsProductData.productName,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildFreshProduct(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Fresh  vigitable'),
              Text(
                'View all',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: productProvider.getFreshProductDataList.map(
              (freshProductData) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productPrice: freshProductData.productPrice,
                          productName: freshProductData.productName,
                          productImage: freshProductData.productImage,
                        ),
                      ),
                    );
                  },
                  child: SingleProdduct(
                    productPrice: freshProductData.productPrice,
                    productImage: freshProductData.productImage,
                    productName: freshProductData.productName,
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildRootProduct() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('freshi frut'),
              Text(
                'View all',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SingleProdduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productPrice: 60,
                          productName: "Fresh vigtabel",
                          productImage:
                              'https://upload.wikimedia.org/wikipedia/commons/4/42/Vegetables_0006.JPG',
                        ),
                      ),
                    );
                  },
                  productPrice: 60,
                  productImage:
                      'https://upload.wikimedia.org/wikipedia/commons/4/42/Vegetables_0006.JPG',
                  productName: "Fresh vigtabel"),
              SingleProdduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productPrice: 60,
                          productName: "Fresh vigtabel",
                          productImage:
                              'https://upload.wikimedia.org/wikipedia/commons/4/42/Vegetables_0006.JPG',
                        ),
                      ),
                    );
                  },
                  productPrice: 60,
                  productImage:
                      'https://upload.wikimedia.org/wikipedia/commons/4/42/Vegetables_0006.JPG',
                  productName: "Fresh vigtabel"),
              SingleProdduct(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductOverview(
                          productPrice: 60,
                          productName: "Fresh vigtabel",
                          productImage:
                              'https://upload.wikimedia.org/wikipedia/commons/4/42/Vegetables_0006.JPG',
                        ),
                      ),
                    );
                  },
                  productPrice: 60,
                  productImage:
                      'https://upload.wikimedia.org/wikipedia/commons/4/42/Vegetables_0006.JPG',
                  productName: "Fresh vigtabel"),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    productProvider = Provider.of(context, listen: false);
    productProvider.fatchHerbsProductData();
    productProvider.fatchFreshProductData();
  }

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of(context);
    // productProvider.fatchHerbsProductData();
    // productProvider.fatchFreshProductData();

    return Scaffold(
      backgroundColor: Color(0xffcbcbcb),
      drawer: DrawerSide(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Color(0xffd4d181),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Search(),
                  ),
                );
              },
              icon: Icon(
                Icons.search,
                size: 17,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              child: Icon(
                Icons.shop,
                size: 17,
                color: Colors.indigo,
              ),
            ),
          )
        ],
        backgroundColor: Color(0xffd6b738),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        child: ListView(children: [
          Container(
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://www.wallpaperflare.com/static/965/895/782/vegetables-herbs-lots-of-wallpaper.jpg')),
                color: Colors.green,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      // color: Colors.red,
                      child: Column(children: [
                        Padding(
                          padding:
                              const EdgeInsets.only(right: 115, bottom: 10),
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xffd1ad17),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(50),
                                  bottomLeft: Radius.circular(50)),
                            ),
                            child: Center(
                              child: Text(
                                'Dagu',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    shadows: [
                                      BoxShadow(
                                          color: Colors.green,
                                          blurRadius: 10,
                                          offset: Offset(3, 3))
                                    ]),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          '25% off',
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.green[100],
                              fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'On all products',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]),
                    )),
                Expanded(child: Container())
              ],
            ),
          ),
          _buildHerbsProduct(context),
          _buildFreshProduct(context),
          // _buildFreshProduct(),

          _buildRootProduct(),
          // _buildHerbsProduct(context),
        ]),
      ),
    );
  }
}
