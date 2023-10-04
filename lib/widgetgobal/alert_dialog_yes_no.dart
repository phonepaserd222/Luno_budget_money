import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
void DialogYesNO({
  required BuildContext context,
  required Function() onPress,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.pink,
        title: const Text('Delete'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pop();
              onPress();
            },
            child: const Text('Yes'),
          ),
          MaterialButton(
            onPressed: () {},
            child: TextButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      );
    },
  );
}