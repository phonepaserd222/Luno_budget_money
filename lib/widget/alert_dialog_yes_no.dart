import 'package:flutter/material.dart';

void DialogYesNO({required BuildContext context}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.pink,
        title: Text('Delete'),
        actions: [
          MaterialButton(
            onPressed: () {},
            child: Text('Yes'),
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

// 
// 
// void DialogYesNo(){
//   showDialog(
//     context: context, 
//     builder: (context) {
//       return AlertDialog(
//         backgroundColor: Colors.pink,
//         title: Text('Delete'),
//         content: Text('Are you sure you want to delete?'),
//         actions: [
//           FlatButton(
//             child: Text('Yes'),
//             onPressed: () {
//               // Perform action when user selects "Yes"
//             },
//           ),
//           FlatButton(
//             child: Text('No'),
//             onPressed: () {
//               // Perform action when user selects "No"
//             },
//           ),
//         ],
//       );
//     },
//   );
// }