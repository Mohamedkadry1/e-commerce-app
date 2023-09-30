import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/review_cart_model.dart';

class ReviewCartProvider with ChangeNotifier {
  double total = 0.0;
  setTotalPrice(){
    total=0;
  }
  getTotalPrice(){

    return total;
  }
  void removeAllReviewCartData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final subcollectionRef = FirebaseFirestore.instance
          .collection('ReviewCart')
          .doc(user.uid)
          .collection('YourReviewCart');

      final querySnapshot = await subcollectionRef.get();

      for (var doc in querySnapshot.docs) {
        await doc.reference.delete();
      }

      print('All review cart items removed successfully.');
    } else {
      print('User is not logged in.');
    }
  }
  void addReviewCartData({
    required String cartId,
    required String cartImage,
    required String cartName,
    required int cartPrice,
    required int cartQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection('YourReviewCart')
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartName": cartName,
      "carImage": cartImage,
      "cartPrice": cartPrice,
      "cartQuantity": cartQuantity,
    });
    total+=cartPrice*cartQuantity;
  }

  List<ReviewCartModel> reviewCartDataList = [];
  void getReviewCartData() async {
    List<ReviewCartModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection('ReviewCart')
        .doc('03GNztaunI8UKImCfF2p')
        .collection('YourReviewCart')
        .get();
    reviewCartValue.docs.forEach((e) {
      print(e.data());
      ReviewCartModel reviewCartModel = ReviewCartModel(
          cartId: e.get('cartId'),
          cartImage: e.get('carImage'),
          cartName: e.get('cartName'),
          cartPrice: e.get('cartPrice'),
          cartQuantity: e.get('cartQuantity'),
      );
      newList.add(reviewCartModel);
    });

    reviewCartDataList = newList;
    notifyListeners();
  }

  List<ReviewCartModel> get getReviewCartDataList {
    return reviewCartDataList;
  }

}
