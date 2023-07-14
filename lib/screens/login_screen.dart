import 'package:flutter/material.dart';
import 'package:luno_budget_money/routes/routes.dart';

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
              Navigator.pushReplacementNamed(context, Routes.welcome);
            },
            icon: const Icon(Icons.login),
            label: const Text('ເຂົ້າສູ່ລະບົບ')),
      ),
    );
  }
}
