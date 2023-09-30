import 'package:e_commerce_iti/models/review_cart_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewCartListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('ReviewCart')
          .doc(currentUser?.uid)
          .collection('YourReviewCart')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return Center(
            child: Text('Your review cart is empty.'),
          );
        }

        final reviewCartItems = snapshot.data!.docs.map((doc) {
          final data = doc.data() as Map<String, dynamic>;
          return ReviewCartModel(
            cartId: data['cartId'],
            cartName: data['cartName'],
            cartImage: data['carImage'],
            cartPrice: data['cartPrice'],
            cartQuantity: data['cartQuantity'],
          );
        }).toList();

        return ListView.builder(
          itemCount: reviewCartItems.length,
          itemBuilder: (context, index) {
            final item = reviewCartItems[index];
            return Column(
              children: [
                ListTile(
                  leading: Image.network(item.cartImage), // Use Image.network for online images
                  title: Text(item.cartName),
                  subtitle: Text('Price: \$${item.cartPrice}           |        Quantity: ${item.cartQuantity}'),
                ),
                Divider(),
              ],
            );
          },
        );
      },
    );
  }
}

