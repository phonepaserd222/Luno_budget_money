import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:luno_budget_money/constants/color_contants.dart';
import 'package:luno_budget_money/screens/home_screen.dart';
import 'package:luno_budget_money/screens/login_screen.dart';
import 'package:luno_budget_money/services/api_get_user.dart';
import 'package:shared_preferences/shared_preferences.dart';
//
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
      future: ApiGetUser().getUser(),
      builder: (context, snapshot) {
        String? token = prefs.getString("accessToken");
        dio.options.headers["authorization"] = token;
        if (token == null) {
          return const LoginScreen();
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        // print(snapshot);
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.hasData) {
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
        // Handle other connection states
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
