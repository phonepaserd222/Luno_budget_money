import 'package:flutter/material.dart';

import 'home_screen.dart';

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
              Navigator.pushReplacement(context, MaterialPageRoute(
                //push-Replacement
                builder: (context) {
                  return const HomeScreen();
                },
              ));
            },
            icon: const Icon(Icons.login),
            label: const Text('BYE BYE')),
      ),
    );
  }
}
