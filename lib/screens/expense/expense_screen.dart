import 'package:flutter/material.dart';

import 'package:flutter/services.dart'; // Import for FilteringTextInputFormatter

import 'package:intl/intl.dart';
import 'package:luno_budget_money/widget/date_pop_screen.dart';

class ExpenScreen extends StatefulWidget {
  const ExpenScreen({super.key});

  @override
  State<ExpenScreen> createState() => _ExpenScreenState();
}

class _ExpenScreenState extends State<ExpenScreen> {
  String dateText = 'Select Date';

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Expense Screen'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
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
                        dateText = DateFormat('dd-MM-yyyy')
                            .format(pickeddate)
                            .toString();
                      });
                    }
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 135, 134, 134))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.calendar_today),
                        Text(dateText),
                      ],
                    ),
                  ),
                ),

                // T2  Cost
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InkWell(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: 'Cost',
                                  prefixIcon: const Icon(Icons.attach_money),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                        ),
                        // Icon(Icons.attach_money),
                      ],
                    ),
                  ),
                ),

                // T3
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryItemPage()));
                  },
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: Color.fromARGB(255, 135, 134, 134))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.category),
                        Text('Select Category'),
                      ],
                    ),
                  ),
                ),
                // T4
                InkWell(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Title',
                              prefixIcon: const Icon(Icons.calculate),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
