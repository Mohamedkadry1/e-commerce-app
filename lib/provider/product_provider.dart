import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import '../models/product_model.dart';

class ProductProvider with ChangeNotifier {
  late ProductModel productModel;
  List<ProductModel> herbsProductList = [];
  List<ProductModel> fruitsProductList = [];
  List<ProductModel> vegetablesProductList = [];
  setVegetablesProductData()async{
    List<ProductModel> newVegetablesProductList = [];
    QuerySnapshot VegatblesProductData =
    await FirebaseFirestore.instance.collection('VegetablesProduct').get();
    VegatblesProductData.docs.forEach((e) {
      // print(e.data());
      productModel = ProductModel(
        productId: e.get('productId'),
          productImage: e.get('productImage'),
          productName: e.get('productName'),
          productPrice: e.get('productPrice'));
      newVegetablesProductList.add(productModel);
    });
    vegetablesProductList=newVegetablesProductList;
    notifyListeners();
  }
  setFruitsProductData()async{
    List<ProductModel> newFruitsProductList = [];
    QuerySnapshot FruitsProductData =
    await FirebaseFirestore.instance.collection('FruitsProduct').get();
    FruitsProductData.docs.forEach((e) {
      // print(e.data());
      productModel = ProductModel(
          productId: e.get('productId'),
          productImage: e.get('productImage'),
          productName: e.get('productName'),
          productPrice: e.get('productPrice'));
      newFruitsProductList.add(productModel);
    });
    fruitsProductList=newFruitsProductList;
    notifyListeners();
  }
  setHerbsProductData() async {
    List<ProductModel> newList = [];

    QuerySnapshot HerbsProductData =
        await FirebaseFirestore.instance.collection('HerbsProduct').get();

    HerbsProductData.docs.forEach((e) {
      // print(e.data());
      productModel = ProductModel(
          productId: e.get('productId'),
          productImage: e.get('productImage'),
          productName: e.get('productName'),
          productPrice: e.get('productPrice'));
      newList.add(productModel);
    });

    herbsProductList=newList;
    notifyListeners();
  }
  List<ProductModel>get getHerbsProductList{
    return herbsProductList;
  }
  List<ProductModel>get getFruitsProductList{
    return fruitsProductList;
  }
  List<ProductModel>get getVegetablesProductList{
    return vegetablesProductList;
  }
}
