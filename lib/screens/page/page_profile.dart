import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:luno_budget_money/constants/color_contants.dart';

class PageProfile extends StatelessWidget {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  PageProfile({super.key});

  void _signOut(BuildContext context) async {
    try {
      await _googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;
    return Scaffold(
      backgroundColor: ColorConstants.colors0, //#FFFCEF
      appBar: AppBar(
        backgroundColor: Colors.white, //#FFFCEF
        centerTitle: true,
        title: const Text(
          'Account Setting',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(user.photoURL!),
                ),
                const SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' ${user.displayName}',
                        style: const TextStyle(fontSize: 15),
                      ),
                      Text(
                        ' ${user.email}',
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          //
          // user name
          //
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 225, 164, 236),
                        border: Border.all(
                          color: const Color.fromARGB(255, 225, 164, 236),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('User name', style: TextStyle(fontSize: 20)),
                  ],
                ),
                Text(
                  ' ${user.displayName}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Divider(color: Colors.black),
          ),
          const SizedBox(height: 30),
          //
          // Email
          //
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 225, 164, 236),
                        border: Border.all(
                          color: const Color.fromARGB(255, 225, 164, 236),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.email_outlined,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('Email', style: TextStyle(fontSize: 20)),
                  ],
                ),
                Text(
                  ' ${user.email}',
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Divider(color: Colors.black),
          ),
          // const SizedBox(height: 32),
          const SizedBox(height: 30),
          //
          // logout
          //
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 225, 164, 236),
                        border: Border.all(
                          color: const Color.fromARGB(255, 225, 164, 236),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.logout_outlined,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text('Log out', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: Divider(color: Colors.black),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () => _signOut(context),
            child: const Text('Sign Out'),
          ),
        ],
      ),
    );
  }
}