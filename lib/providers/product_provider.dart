import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterproject/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  // Single instance of ProductModel
  ProductModel? productModel;
  List<ProductModel> search = [];

  void productModels(QueryDocumentSnapshot element) {
    // Update the existing instance with new data
    productModel = ProductModel(
      productImage: element.get('productImage') ?? '',
      productName: element.get('productName') ?? '',
      productPrice: element.get('productPrice') ?? 0,
      productId: element.get('productId') ?? '',
    );

    // Add the single instance to both lists
    // herbsProductList.add(productModel!);
    // freshProductList.add(productModel!);
    search.add(productModel!);
  }

  List<ProductModel> herbsProductList = [];

  Future<void> fatchHerbsProductData() async {
    try {
      List<ProductModel> newList = [];
      QuerySnapshot value =
          await FirebaseFirestore.instance.collection('HerbsProduct').get();

      value.docs.forEach(
        (element) {
          print(element.data());
          productModels(element);
          newList.add(productModel!);
        },
      );

      herbsProductList = newList;
      notifyListeners();
    } catch (error) {
      print('Error fetching herbs data: $error');
    }
  }

  List<ProductModel> get getHerbsProductDataList {
    return herbsProductList;
  }

  List<ProductModel> freshProductList = [];

  Future<void> fatchFreshProductData() async {
    try {
      List<ProductModel> newList = [];
      QuerySnapshot value =
          await FirebaseFirestore.instance.collection('FreshProduct').get();

      value.docs.forEach(
        (element) {
          print(element.data());
          productModels(element);
          newList.add(productModel!);
        },
      );

      freshProductList = newList;
      notifyListeners();
    } catch (error) {
      print('Error fetching fresh data: $error');
    }
  }

  List<ProductModel> get getFreshProductDataList {
    return freshProductList;
  }

  /////////////////search return////////////

  List<ProductModel> get getAllProductSeacrch {
    return search;
  }
}
