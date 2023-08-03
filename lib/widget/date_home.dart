import 'package:flutter/material.dart';

class Datehome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8),
        buildContainerWithShadow('Daily', Colors.white),
        SizedBox(width: 8),
        buildContainerWithShadow('Weekly', Colors.white),
        SizedBox(width: 8),
        buildContainerWithShadow('Monthly', Colors.white),
        SizedBox(width: 8),
        buildContainerWithShadow('Yearly', Colors.white),
        SizedBox(width: 8),
      ],
    );
  }

  Widget buildContainerWithShadow(String text, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 35),
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
            style: TextStyle(color: Colors.black, fontSize: 13),
            maxLines: 1,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }
}
