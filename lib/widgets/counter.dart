import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_iti/models/review_cart_model.dart';
import 'package:e_commerce_iti/provider/review_cart_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../config/colors.dart';

class Count extends StatefulWidget {
  String productName;
  String productImage;
  String productId;
  int productPrice;
  String productUnit;
  int productQuantity;

  Count({
    required this.productName,
    required this.productUnit,
    required this.productId,
    required this.productImage,
    required this.productPrice,
    required this.productQuantity,
  });
  @override
  _CountState createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isTrue = false;

  getAddAndQuantity() {
    FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourReviewCart")
        .doc(widget.productId)
        .get()
        .then(
          (value) => {
            if (this.mounted)
              {
                if (value.exists)
                  {
                    setState(() {
                      count = value.get("cartQuantity");
                      isTrue = value.get("isAdd");
                    })
                  }
              }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    // getAddAndQuantity();
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    return Expanded(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isTrue
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      if (count == 1) {
                        setState(() {
                          isTrue = false;
                        });
                        // reviewCartProvider.reviewCartDataDelete(widget.productId);
                      } else if (count > 1) {
                        setState(() {
                          count--;
                        });
                        // reviewCartProvider.updateReviewCartData(
                        //   cartId: widget.productId,
                        //   cartImage: widget.productImage,
                        //   cartName: widget.productName,
                        //   cartPrice: widget.productPrice,
                        //   cartQuantity: count,
                        // );
                      }
                    },
                    child: Icon(
                      Icons.remove,
                      size: 22,
                      color: Color(0xffd0b84c),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "$count",
                      style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        count++;
                      });
                      // reviewCartProvider.updateReviewCartData(
                      //   cartId: widget.productId,
                      //   cartImage: widget.productImage,
                      //   cartName: widget.productName,
                      //   cartPrice: widget.productPrice,
                      //   cartQuantity: count,
                      // );
                    },
                    child: Icon(
                      Icons.add,
                      size: 22,
                      color: Color(0xffd0b84c),
                    ),
                  ),
                ],
              )
            : Center(
                child: InkWell(
                  onTap: () {
                    setState(() {
                      isTrue = true;
                    });
                    reviewCartProvider.addReviewCartData(
                        cartId: widget.productId,
                        cartImage: widget.productImage,
                        cartName: widget.productName,
                        cartPrice: widget.productPrice,
                        cartQuantity: widget.productQuantity);
                  },
                  child: Text(
                    "ADD",
                    style: TextStyle(color: primaryColor),
                  ),
                ),
              ),
      ),
    );
  }
}
