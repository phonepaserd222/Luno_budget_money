import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:luno_budget_money/screens/welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SizedBox(
        // width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                //push-Replacement
                builder: (context) {
                  return const WelcomeScreen();
                },
              ));
            },
            icon: const Icon(Icons.login),
            label: const Text('ເຂົ້າສູ່ລະບົບ')),
      ),
    );
  }
}
