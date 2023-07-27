import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
// import 'package:luno_budget_money/routes/routes.dart';
import 'package:luno_budget_money/screens/home_screen.dart';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user == null) {
        debugPrint("null");
        return;
      } else {
        Future.delayed(Duration.zero)
            // .then((value) => Navigator.pushNamed(context, Routes.home));
            .then(
          (value) =>
              // Navigator.pushNamed(context, Routes.home, arguments: user)
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
              // Pass the arguments as part of the RouteSettings. The
              // DetailScreen reads the arguments from these settings.
              settings: RouteSettings(
                arguments: user,
              ),
            ),
          ),
        );
      }

      // TODO: Navigate to the home screen or perform other actions
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
