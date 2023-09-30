import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class UserProvider with ChangeNotifier {
  void addUserData(
      {required User currentUser,
      required String userName,
      required String userEmail,
      required String userImage}) async {
    await FirebaseFirestore.instance
        .collection("userData")
        .doc(currentUser.uid)
        .set(
      {
        'userName': userName,
        'userEmail': userEmail,
        'userImage': userImage,
        'userId': currentUser.uid
      },
    );
  }
}
