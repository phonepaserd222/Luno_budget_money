import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:luno_budget_money/constants/color_contants.dart';
import 'package:luno_budget_money/services/api_get_user.dart';
import 'package:luno_budget_money/widget/function_logout.dart';

import '../../widget/function_signout.dart';

class PageProfile extends StatelessWidget {
  final GoogleSignIn googleSignIn = GoogleSignIn();
  PageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
      backgroundColor: ColorConstants.bgwhite, //#FFFCEF
      appBar: AppBar(
        backgroundColor: Colors.white, //#FFFCEF
        centerTitle: true,
        title: const Text(
          'Account Setting',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
        future: ApiGetUser().getUser(),
        builder: (context, snapshot) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          snapshot.data?.image ?? '${user?.photoURL}'),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' ${snapshot.data?.userName ?? '${user?.displayName}'}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            ' ${user?.email ?? ''}',
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
                    Expanded(
                      flex: 2,
                      child: Row(
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
                          const Text('User name',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                    ),
                    // const SizedBox(width: 100),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ' ${snapshot.data?.userName ?? '${user?.displayName}'}',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 80, right: 15),
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
                    Expanded(
                      flex: 2,
                      child: Row(
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
                    ),
                    // const SizedBox(width: 50),
                    Expanded(
                      flex: 2,
                      child: Text(
                        ' ${user?.email ?? ''}',
                        textAlign: TextAlign.end,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 80, right: 15),
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
                        TextButton(
                            onPressed: () => signOut(context),
                            child: const Text(
                              'LogOut',
                              style: TextStyle(fontSize: 20),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () => LogOutUser(context),
                // _signOut(context),
                child: const Text('Sign Out'),
              ),
            ],
          );
        },
      ),
    );
  }
}
