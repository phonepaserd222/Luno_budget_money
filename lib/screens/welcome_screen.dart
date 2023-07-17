import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luno_budget_money/routes/routes.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.black,
        title: const Text('Beerwarn Movie'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                onPressed: () {
                  auth.signOut().then((value) {
                    Navigator.pushReplacementNamed(context, Routes.home);
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: const Text('ອອກລະບົບ')),
          ),
        ],
        // bottom: const PreferredSize(
        //   preferredSize: Size.fromHeight(60),
        //   child: Padding(
        //     padding: EdgeInsets.only(bottom: 10),
        //     child: Row(
        //       children: [Text('data')],
        //     ),
        //   ),
        // )
      ),
    );
  }
}
