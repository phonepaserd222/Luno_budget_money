import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HomeScreen extends StatelessWidget {
  final User user;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  HomeScreen({Key? key, required this.user}) : super(key: key);

  void _signOut(BuildContext context) async {
    try {
      await _googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();

      Navigator.pop(context);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 226, 184), //#FFFCEF
      appBar: AppBar(
        title: const Text('LUNO Budget Buddy'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () => _signOut(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text('Sign Out'),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(height: 16),
            Text(
              'Welcome, ${user.displayName} sama',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
