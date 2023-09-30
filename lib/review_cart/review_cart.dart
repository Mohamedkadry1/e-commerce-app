/*
import 'package:e_commerce_iti/screens/home/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../models/review_cart_model.dart';
import '../provider/review_cart_provider.dart';

class ReviewCart extends StatelessWidget {
  ReviewCartProvider reviewCartProvider=ReviewCartProvider();
  showAlertDialog(BuildContext context, ReviewCartModel delete) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = TextButton(
      child: Text("Yes"),
      onPressed: () {
        // reviewCartProvider.reviewCartDataDelete(delete.cartId);
        // Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you devete on cartProduct?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
      bottomNavigationBar: ListTile(
        title: Text("Total Aount"),
        // subtitle: Text(
        //   "\$ ${reviewCartProvider.getTotalPrice()}",
        //   style: TextStyle(
        //     color: Colors.green[900],
        //   ),
        // ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            child: Text("Submit"),
            color: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                30,
              ),
            ),
            onPressed: () {
              if(reviewCartProvider.getReviewCartDataList.isEmpty){
                // return Fluttertoast.showToast(msg: "No Cart Data Found");
              }
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => DeliveryDetails(),
              //   ),
              // );
            },
          ),
        ),
      ),
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Review Cart",
          style: TextStyle(color: textColor, fontSize: 18),
        ),
      ),
      body: reviewCartProvider.getReviewCartDataList.isEmpty
          ? Center(
              child: Text("NO DATA"),
            )
          : ListView.builder(
              itemCount: reviewCartProvider.getReviewCartDataList.length,
              itemBuilder: (context, index) {
                ReviewCartModel data =
                    reviewCartProvider.getReviewCartDataList[index];
                return Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SingleProduct(
                      // isBool: true,
                      // wishList: false,
                      productImage: data.cartImage,
                      productName: data.cartName,
                      productPrice: data.cartPrice,
                      productId: data.cartId,
                      productQuantity: data.cartQuantity,
                      // productUnit: data.cartUnit,
                      // onDelete: () {
                      //   showAlertDialog(context, data);
                      // },
                      onTap: () {  },
                    ),
                  ],
                );
              },
            ),
    );
  }
}
*/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_iti/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../config/colors.dart';
import '../display/display.dart';
import '../models/review_cart_model.dart';
import '../provider/review_cart_provider.dart';
import '../widgets/single_item.dart';

Widget _buildUserList() {
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('ReviewCart')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .collection('YourReviewCart').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error');
        }
        /*    if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator.adaptive());
        }*/
        return ListView(
          shrinkWrap: true,
          children: snapshot.data?.docs
                  .map<Widget>((doc) => _buildUserListItem(doc))
                  .toList() ??
              [],
        );
      });
}

Widget _buildUserListItem(DocumentSnapshot document) {
  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
  return Container(
    height: 230,
    width: 300,
    color: Colors.red,
    child: Column(
      children: [
        Image.network(data['carImage'],height: 100,),
        ListTile(
          leading: Text(data['cartId']),
          title: Text(data['cartName']),
        ),
      ],
    ),
  );
}

class ReviewCart extends StatelessWidget {
  ReviewCartProvider reviewCartProvider = ReviewCartProvider();

  @override
  Widget build(BuildContext context) {
    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    reviewCartProvider.getReviewCartData();
    return Scaffold(
        bottomNavigationBar: ListTile(
          title: Text("Total Aount"),
          subtitle: Text(
            "\$ ${reviewCartProvider.getTotalPrice()}",
            style: TextStyle(
              color: Colors.green[900],
            ),
          ),
          trailing: Container(
            width: 160,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor
              ),
              child: Text("Submit"),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: CircleAvatar(backgroundColor: Colors.orange,radius: 30, child: Icon(Icons.check,weight: 50,size:50,color: Colors.white,)),
                      content: Text('Done'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                Future.delayed(Duration(seconds: 4), () {
                  reviewCartProvider.removeAllReviewCartData();
                  reviewCartProvider.setTotalPrice();
                });
                Future.delayed(Duration(seconds: 2), () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomeScreen()));
                });

              },
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: Text(
            "Review Cart",
            style: TextStyle(color: textColor, fontSize: 18),
          ),
        ),
        body:ReviewCartListView(),
        // Container(
        //   height: 300,
        //   width: 300,
        //   color: Colors.red,
        //   child: _buildUserList(),
        // )
        );
  }
}
