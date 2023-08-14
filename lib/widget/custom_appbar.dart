import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:luno_budget_money/services/api_get_user.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  CustomAppBarState createState() => CustomAppBarState();
}

class CustomAppBarState extends State<CustomAppBar> {
  Future getCategory() async {
    // Implement your asynchronous logic here
    await Future.delayed(const Duration(seconds: 2));
    return "Data Loaded";
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User?;
    return AppBar(
      title: FutureBuilder(
        future: ApiGetUser().getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return Row(
                children: [
                  Title(color: Colors.black, child: const Text('ok')),
                  CircleAvatar(
                    backgroundImage:
                        NetworkImage(user?.photoURL ?? '${snapshot.data}'),
                  ),
                  const SizedBox(
                    width: 30,
                  )
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
