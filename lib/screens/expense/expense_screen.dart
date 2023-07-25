import 'package:flutter/material.dart';

import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter

import 'package:intl/intl.dart';

class ExpenScreen extends StatefulWidget {
  const ExpenScreen({super.key});

  @override
  State<ExpenScreen> createState() => _ExpenScreenState();
}

class _ExpenScreenState extends State<ExpenScreen> {
  String dateText = 'Select Date';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),

            // T1 Date
            InkWell(
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2023, 12, 31),
                );
                if (pickeddate != null) {
                  setState(() {
                    dateText =
                        DateFormat('dd-MM-yyyy').format(pickeddate).toString();
                  });
                }
              },
              child: Container(
                height: 60,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2.5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 215, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calendar_today),
                    Text(dateText),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),

            // T2  Cost
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2.5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 215, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.attach_money),
                    Text('Enter Cost'),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(labelText: ""),
                        keyboardType: TextInputType.number,

                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        // Only numbers can be entered
                      ),
                    ),
                    // Icon(Icons.attach_money),

                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),

            // T3
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2.5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 215, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.category),
                    Text('Select Category'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
            // T4
            InkWell(
              onTap: () {},
              child: Container(
                height: 60,
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 2.5),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 234, 215, 215),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calculate),
                    Text('Title'),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
