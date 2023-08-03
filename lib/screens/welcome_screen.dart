import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widget/bottom_bar.dart';

class WelcomeScreen extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarExample();
  }
}
