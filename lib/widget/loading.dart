import 'package:flutter/material.dart';

class Loading {
  static void show(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return const Dialog(
            backgroundColor: Colors.white,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 15,
                  ),
                  Text('Loading...')
                ],
              ),
            ),
          );
        });
  }

  static void hide(BuildContext context) {
    Navigator.pop(context);
  }
}
