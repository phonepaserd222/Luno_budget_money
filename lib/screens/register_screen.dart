import 'package:flutter/material.dart';
import 'package:luno_budget_money/screens/home_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SizedBox(
        // width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                //push-Replacement
                builder: (context) {
                  return const HomeScreen();
                },
              ));
            },
            icon: const Icon(Icons.login),
            label: const Text('Register')),
      ),
    );
  }
}
