import 'package:flutter/material.dart';

void errorDialog({
  required String error,
  required BuildContext context,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('An error occurred'),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Your account or password is incorrect'),
            Text('Please try again'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    ),
  );
}
