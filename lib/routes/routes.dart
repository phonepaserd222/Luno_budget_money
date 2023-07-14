import 'package:flutter/material.dart';
import 'package:luno_budget_money/screens/home_screen.dart';
import 'package:luno_budget_money/screens/login_screen.dart';
import 'package:luno_budget_money/screens/register_screen.dart';

class Routes {
  Routes._();
  static const String home = '/homescreen';
  static const String register = '/registerscreen';
  static const String login = '/loginscreen';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (context) => const HomeScreen());
      case register:
        return MaterialPageRoute(builder: (context) => const RegisterScreen());
      case login:
        return MaterialPageRoute(builder: (context) => const LoginScreen());
      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
