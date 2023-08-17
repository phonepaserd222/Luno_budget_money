import 'package:flutter/material.dart';
import 'package:luno_budget_money/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> logout(BuildContext, context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear(); // Clear stored credentials
  // Navigate to the login screen
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => const LoginScreen()),
    (Route<dynamic> route) => false,
  );
}
