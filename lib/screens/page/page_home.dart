import 'package:flutter/material.dart';
import '../../routes/routes.dart';

class PageHome extends StatelessWidget {
  const PageHome();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Luno budget buddy'),
        actions: const [
          SizedBox(
            child: Icon(
              Icons.person,
              size: 40,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          MyRowWithContainers(), // Add the MyRowWithContainers widget here
          SizedBox(
              height: 16), // Add a little space between the row and the button
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, Routes.expensescreen);
            },
            child: Text('Go to Expense Screen'),
          ),
        ],
      ),
    );
  }
}

class MyRowWithContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        buildContainerWithShadow('Daily', Colors.blue),
        SizedBox(width: 8),
        buildContainerWithShadow('Weekly', Colors.red),
        SizedBox(width: 8),
        buildContainerWithShadow('Monthly', Colors.red),
        SizedBox(width: 8),
        buildContainerWithShadow('Yearly', Colors.red),
      ],
    );
  }

  Widget buildContainerWithShadow(String text, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(left: 10, right: 10, top: 35),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(text,
            style: TextStyle(color: Colors.white, fontSize: 15),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
