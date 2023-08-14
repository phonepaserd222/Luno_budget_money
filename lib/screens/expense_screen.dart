// import 'dart:async';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:luno_budget_money/data/category_stream.dart';
import 'package:luno_budget_money/models/response_create_expense_model.dart';
import 'package:luno_budget_money/widget/category_item_page.dart';

import '../models/response_get_category_screen.dart';
// Import the category data from the other page

class ExpenScreen extends StatefulWidget {
  const ExpenScreen({super.key});

  @override
  State<ExpenScreen> createState() => _ExpenScreenState();
}

class _ExpenScreenState extends State<ExpenScreen> {
  List<ResponseCreateExpenseModel> createExpense = [];
//
  final TextEditingController dateController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  int cost = 0;
  //
  CategoryStrem categoryStrem = CategoryStrem();
  ResponseGetCategoryModel? selectedCategory;
  String dateText = 'Select Date';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Expense Screen'),
            backgroundColor: const Color.fromRGBO(112, 20, 204, 1)),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
              child: Column(children: [
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
                        DateFormat('yyyy-MM-dd').format(pickeddate).toString();
                  });
                }
              },
              child: Container(
                height: 60,
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromRGBO(112, 20, 204, 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(Icons.calendar_today),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(dateText),
                    // TextField(
                    //   controller: dateController,
                    //   decoration: InputDecoration(labelText: dateText),
                    // ),
                  ],
                ),
              ),
            ),

            // T2  Cost
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: costController,
                        decoration: InputDecoration(
                          labelText: 'Cost',
                          prefixIcon: const Icon(Icons.money),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(112, 20, 204, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(112, 20, 204, 1)),
                            borderRadius: BorderRadius.circular(5),
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

            Container(
              height: 60,
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  border:
                      Border.all(color: const Color.fromRGBO(112, 20, 204, 1))),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    elevation: 0.0,
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.white),
                onPressed: () {
                  //TODO: m
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CategoryItemPage(
                        onCategorySelected: (category) {
                          categoryStrem.onCategorySelected(category);
                        },
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.category,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    StreamBuilder<ResponseGetCategoryModel>(
                        stream: categoryStrem.categoryStremController,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.hasData
                                ? snapshot.data?.id ?? ""
                                : 'No Category Selected',
                            style: const TextStyle(color: Colors.black),
                          );
                        }),
                  ],
                ),
              ),
            ),

            // T4
            InkWell(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          labelText: 'Title',
                          prefixIcon: const Icon(Icons.calculate),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                                width: 1,
                                //TODo : color constants
                                color: Color.fromRGBO(112, 20, 204, 1)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 1,
                                color: Color.fromRGBO(112, 20, 204, 1)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              width: double.infinity,
              height: 58,

              // Color: const Colors.fromRGBO(112, 20, 204, 1)
              padding: const EdgeInsets.only(
                left: 12,
                right: 12,
              ),
              margin: const EdgeInsets.only(top: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(17),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0.0,
                      shadowColor: Colors.transparent,
                      backgroundColor: const Color.fromRGBO(112, 20, 204, 1)),
                  onPressed: () {
                    cost = int.tryParse(costController.text) ?? 0;
                    String title = titleController.text.trim();
                    if (title.isNotEmpty) {
                      setState(() {
                        createExpense.insert(
                            0,
                            ResponseCreateExpenseModel(
                                date: dateText,
                                title: title,
                                amount: cost,
                                categoryId: selectedCategory?.id ?? ""));
                      });
                    }
                  },
                  child: const Text(
                    'Save',
                  ),
                ),
              ),
            ),
          ])),
        ),
      ),
    );
  }
}
