import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

final GoogleSignIn googleSignIn = GoogleSignIn();

void signOut(BuildContext context) async {
  try {
    await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  } catch (e) {
    Navigator.pop(context);
    debugPrint(e.toString());
  }
}
