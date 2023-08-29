// import 'dart:async';

import 'package:flutter/material.dart';

import 'package:luno_budget_money/data/category_stream.dart';
import 'package:luno_budget_money/widget/category_item_page.dart';

import '../models/response_get_category_screen.dart';
import '../routes/routes.dart';
import '../services/api_update_expense.dart';
// Import the category data from the other page

class UpdateExpenseScreen extends StatefulWidget {
  final String expenseId;
  // final String date;
  final String title;
  final String amount;
  final String categoryId;
  final String categoryname;
  const UpdateExpenseScreen({
    super.key,
    required this.expenseId,
    // required this.date,
    required this.title,
    required this.amount,
    required this.categoryId,
    required this.categoryname,
  });

  @override
  State<UpdateExpenseScreen> createState() => _UpdateExpenseScreenState();
}

class _UpdateExpenseScreenState extends State<UpdateExpenseScreen> {
  // List<ResponseCreateExpenseModel> createExpense = [];
//
  // final TextEditingController dateController = TextEditingController();
  final TextEditingController costController = TextEditingController();
  // final TextEditingController categoryController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

  int cost = 0;
  //
  CategoryStrem categoryStrem = CategoryStrem();
  ResponseGetCategoryModel? selectedCategory;
  String dateText = 'Select Date';
  String categoryId = "";

  @override
  Widget build(BuildContext context) {
    // TO DO: implement build
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
            title: const Text('Update Expense'),
            backgroundColor: const Color.fromRGBO(112, 20, 204, 1)),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
              child: Column(children: [
            const SizedBox(
              height: 15,
            ),

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
                          labelText: widget.amount,
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
                  //TO DO: m
                  showModalBottomSheet(
                    context: context,
                    builder: (BuildContext context) {
                      return CategoryItemPage(
                        onCategorySelected: (category) {
                          // print(category);
                          // print('test');
                          categoryStrem.onCategorySelected(category);
                          setState(() {
                            categoryId = category.id;
                          });
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
                            // widget.categoryname,
                            snapshot.hasData
                                ? snapshot.data?.categoryName ?? ""
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
                          labelText: widget.title,
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
                  onPressed: () async {
                    cost = int.tryParse(costController.text) ?? 0;
                    String title = titleController.text.trim();
                    if (title.isNotEmpty) {
                      await ApiUpdateExpense()
                          .updateExpense(
                              expenseId: widget.expenseId,
                              // date: widget.date,
                              title: title,
                              amount: cost,
                              categoryId: categoryId)
                          .then((value) =>
                              Navigator.pushNamed(context, Routes.home));
                      setState(() {});
                    }
                  },
                  child: const Text(
                    'Update',
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
