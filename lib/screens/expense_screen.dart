// import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:luno_budget_money/constants/api_constants.dart';
import 'package:luno_budget_money/data/category_stream.dart';
import 'package:luno_budget_money/models/response_get_category_find_many_model.dart';
import 'package:luno_budget_money/widget/category_item_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/response_get_category_screen.dart';
import '../routes/routes.dart';
// Import the category data from the other page

class ExpenScreen extends StatefulWidget {
  const ExpenScreen({super.key});

  @override
  State<ExpenScreen> createState() => _ExpenScreenState();
}

class _ExpenScreenState extends State<ExpenScreen> {
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
                    StreamBuilder<ResponseGetCategoryFindManyModel>(
                        stream: categoryStrem.categoryStremController,
                        builder: (context, snapshot) {
                          return Text(
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
                  onPressed: () async {
                    cost = int.tryParse(costController.text) ?? 0;
                    String title = titleController.text.trim();
                    if (title.isNotEmpty) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      String? token = prefs.getString("accessToken");
                      final dio = Dio();
                      dio.options.headers["authorization"] = token;
                      // print({
                      //   "date": dateText,
                      //   "title": title,
                      //   "amount": cost,
                      //   "categoryId": categoryId
                      // });
                      // ignore: unused_local_variable
                      final response = await dio.post(
                          "${ApiConstants.baseUrl}"
                          "${ApiConstants.pathPostExpense}",
                          data: {
                            "date": dateText,
                            "title": title,
                            "amount": cost,
                            "categoryId": categoryId
                          }).then((value) {
                        // ignore: unnecessary_null_comparison
                        if (value == null) {
                        } else {
                          titleController.clear();
                          costController.clear();
                          dateText = "";
                          Navigator.pushNamed(context, Routes.home);
                        }
                      });
                      debugPrint('success');
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
