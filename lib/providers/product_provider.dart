import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  //////herbs product/////////
  List<ProductModel> herbsProductList = [];

  Future<void> fatchHerbsProductData() async {
    try {
      List<ProductModel> newList = [];
      QuerySnapshot value =
          await FirebaseFirestore.instance.collection('HerbsProduct').get();

      value.docs.forEach(
        (element) {
          print(element.data());
          ProductModel productModel = ProductModel(
            productImage: element.get('productImage') ?? '',
            productName: element.get('productName') ?? '',
            productPrice: element.get('productPrice') ?? 0,
          );
          newList.add(productModel);
        },
      );

      herbsProductList = newList;
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

  /////// fresh product///////

  List<ProductModel> freshProductList = [];

  Future<void> fatchFreshProductData() async {
    try {
      List<ProductModel> newList = [];
      QuerySnapshot value =
          await FirebaseFirestore.instance.collection('FreshProduct').get();

      value.docs.forEach(
        (element) {
          print(element.data());
          ProductModel productModel = ProductModel(
            productImage: element.get('productImage') ?? '',
            productName: element.get('productName') ?? '',
            productPrice: element.get('productPrice') ?? 0,
          );
          newList.add(productModel);
        },
      );

      freshProductList = newList;
      notifyListeners();
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  List<ProductModel> get getFreshProductDataList {
    return freshProductList;
  }
}
