import 'package:flutter/material.dart';
import 'package:luno_budget_money/routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Luno Budget Buddy'),
      ),
      body: SizedBox(
        // width: double.infinity,
        child: ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacementNamed(context, Routes.home);
            },
            icon: const Icon(Icons.login),
            label: const Text('BYE BYE')),
      ),
    );
  }
}
