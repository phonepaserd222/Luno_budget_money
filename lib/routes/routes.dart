// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:luno_budget_money/widget/date_pop_screen.dart';
// import 'package:luno_budget_money/screens/home_screen.dart';
import 'package:luno_budget_money/features/login/presentation/screen/login_screen.dart';
import 'package:luno_budget_money/screens/register_screen.dart';
import 'package:luno_budget_money/screens/welcome_screen.dart';
import 'package:luno_budget_money/screens/expense_screen.dart';

import '../screens/home_screen.dart';

class Routes {
  Routes._();
  static const String home = '/homescreen';
  static const String register = '/registerscreen';
  static const String login = '/loginscreen';
  static const String welcome = '/welcomescreen';
  static const String datepopscreen = '/datepopscreen';
  static const String expensescreen = '/expensescreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      case welcome:
        return MaterialPageRoute(builder: (context) => WelcomeScreen());
      case expensescreen:
        return MaterialPageRoute(builder: (context) => const ExpenScreen());
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      default:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
    }
  }
}
