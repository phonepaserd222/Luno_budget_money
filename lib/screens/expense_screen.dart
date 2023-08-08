import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';
import 'package:luno_budget_money/data/category_stream.dart';
import 'package:luno_budget_money/widget/category_item_page.dart';

import 'package:luno_budget_money/models/data.dart';

import '../models/expense_screen_model.dart'; // Import the category data from the other page

class ExpenScreen extends StatefulWidget {
  const ExpenScreen({super.key});

  @override
  State<ExpenScreen> createState() => _ExpenScreenState();
}

class _ExpenScreenState extends State<ExpenScreen> {
  List<ExpenseScreenModel> listdata = [];
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  final TextEditingController costController = TextEditingController();
  final TextEditingController titleController = TextEditingController();
  //

  CategoryStrem categoryStrem = CategoryStrem();
  Category? selectedCategory;
  String dateText = 'Select Date';

  @override
  void dispose() {
    categoryStrem.onDispose();
    super.dispose();
  }

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
                        DateFormat('dd-MM-yyyy').format(pickeddate).toString();
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
                  ],
                ),
              ),
            ),

            // T2  Cost
            InkWell(
              onTap: () {},
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
                    StreamBuilder<Category>(
                        stream: categoryStrem.categoryStremController,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.hasData
                                ? snapshot.data?.name ?? ""
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
              onTap: () {},
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
                    // final updatedCategory = Category(
                    //   icon: Category[index].IconData,

                    //   // id: int.tryParse(idController.text) ?? 0,
                    //   name: Category[index].text,

                    // );
                    // updateTask(index, updatedTask);
                    // Navigator.of(context).pop();
                    String cost = costController.text.trim();
                    String title = titleController.text.trim();
                    if (cost.isEmpty || title.isEmpty) {
                      setState(() {
                        listdata.insert(
                            0,
                            ExpenseScreenModel(
                                // dateText: dateText,
                                cost: cost,
                                // categorySelected: categoryStrem
                                // .categoryStremController
                                // .toString(),
                                title: title));
                        costController.clear();
                        titleController.clear();
                        // dateText = null;
                      });
                    }
                  },
                  child: const Text(
                    'Save',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ListView.builder(
                  itemCount: listdata.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.purple)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: [
                                const Column(
                                  children: [
                                    // Text(listdata[index].categorySelected),
                                    // Text(listdata[index].dateText),
                                  ],
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(listdata[index].title),
                                Text(listdata[index].cost),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Delete ?'),
                                    // content: const Text(
                                    //     'Are you sure you want to delete this item?'),
                                    actions: [
                                      MaterialButton(
                                        child: const Text('No'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      MaterialButton(
                                        child: const Text('Yes'),
                                        onPressed: () {
                                          // remove item from list
                                          setState(() {
                                            listdata.remove(listdata[index]);
                                          });
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ])),
        ),
      ),
    );
  }
}
