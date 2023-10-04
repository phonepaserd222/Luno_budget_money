import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../routes/routes.dart';

// ignore: non_constant_identifier_names
void LogOutUser(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove("accessToken");
  // ignore: use_build_context_synchronously
  Navigator.pushReplacementNamed(context, Routes.login);
}
