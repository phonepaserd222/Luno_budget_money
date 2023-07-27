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
                        border:
                            Border.all(color: Color.fromRGBO(112, 20, 204, 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.calendar_today),
                        SizedBox(
                          width: 16,
                        ),
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
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: 'Cost',
                              prefixIcon: const Icon(Icons.money),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(112, 20, 204, 1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(112, 20, 204, 1)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        // Icon(Icons.attach_money),
                      ],
                    ),
                  ),
                ),

                InkWell(
                  child: Container(
                    height: 60,
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Color.fromRGBO(112, 20, 204, 1))),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0.0,
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.white),
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (BuildContext context) {
                            return CategoryItemPage();
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.category,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Select Category',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      ),
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
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(112, 20, 204, 1)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(112, 20, 204, 1)),
                                borderRadius: BorderRadius.circular(8),
                              ),
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
