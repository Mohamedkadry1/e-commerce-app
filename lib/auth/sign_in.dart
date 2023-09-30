import 'package:e_commerce_iti/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:sign_in_button/sign_in_button.dart';

// import '../screens/home/home.dart';
import '../screens/home/home_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserProvider userProvider = UserProvider();
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  Future<User?> _googleSignUp() async {
    try {
      final GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: ['email'],
      );
      final FirebaseAuth _auth = FirebaseAuth.instance;

      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // User canceled the sign-in.
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      final User user = userCredential.user!;
      userProvider.addUserData(
          currentUser: user,
          userName: user.displayName.toString().toUpperCase(),
          userEmail: user.email.toString(),
          userImage: user.photoURL.toString());
      print("Signed in: ${user.displayName}");
      return user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        print("FirebaseAuthException: ${e.message}");
      } else if (e is PlatformException) {
        print("PlatformException: ${e.message}");
      } else {
        print("An unknown error occurred.");
      }
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    userProvider = Provider.of<UserProvider>(context);
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/background.png'),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Text("sign in to countinue"),
            SizedBox(
              height: 20,
            ),
            Animate(
              effects: [FadeEffect(), ScaleEffect()],
              child:  Text(
                "I N S T A",
                style: TextStyle(fontSize: 50, shadows: [
                  Shadow(color: Colors.white, offset: Offset(3, 3), blurRadius: 5)
                ]),
              ).animate()
                  .fade(duration: 1.seconds)
                  .scale(delay: 100.ms) ,
            ),

            SizedBox(
              height: 20,
            ),
            SignInButton(
              Buttons.google,
              text: "Sign in with Google",
              onPressed: () async {
                await _googleSignUp().then(
                  (value) => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                );
              },
            ),
            SizedBox(
              height: 20,
            ),
            SignInButton(
              Buttons.apple,
              text: "Sign in with Apple",
              onPressed: () async {
                await signOut();
              },
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'By signing in you are agreeing to our ',
              style: TextStyle(color: Colors.grey[800]),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '  Terms and privacy policy ',
              style: TextStyle(color: Colors.grey[800]),
            ),
          ],
        ),
      ),
    );
  }
}
