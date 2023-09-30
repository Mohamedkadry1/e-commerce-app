import 'package:e_commerce_iti/auth/sign_in.dart';
import 'package:e_commerce_iti/models/review_cart_model.dart';
import 'package:e_commerce_iti/provider/product_provider.dart';
import 'package:e_commerce_iti/provider/review_cart_provider.dart';
import 'package:e_commerce_iti/provider/user_provider.dart';
// import 'package:e_commerce_iti/screens/home/home.dart';
import 'package:e_commerce_iti/screens/home/home_screen.dart';
import 'package:e_commerce_iti/splash_screen/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
