import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luno_budget_money/constants/color_contants.dart';
import 'package:luno_budget_money/screens/home_screen.dart';
import 'package:luno_budget_money/screens/login_screen.dart';
import 'package:luno_budget_money/services/api_get_category_expense.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'firebase_options.dart';
import 'routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final dio = Dio();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // ern sai pref

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FutureBuilder(
      future: ApiGetCategoryExpense().getCategoryExpense(),
      // stream: ,
      builder: (context, snapshot) {
        String? token = prefs.getString("accessToken");
        dio.options.headers["authorization"] = token;
        if (snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    ),
    // initialRoute: Routes.login,
    onGenerateRoute: Routes.generateRoute,
    theme: ThemeData(
      primarySwatch: Colors.deepPurple,
      primaryColor: ColorConstants.colors4,
      appBarTheme: const AppBarTheme(color: ColorConstants.colors4),
    ),
  ));
}
