// import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:luno_budget_money/data/category_stream.dart';
import 'package:luno_budget_money/widget/category_item_page.dart';

import 'package:luno_budget_money/model/data.dart';
// Import the category data from the other page
import 'package:http/http.dart' as http;

class ExpenScreen extends StatefulWidget {
  const ExpenScreen({super.key});

  @override
  State<ExpenScreen> createState() => _ExpenScreenState();
}

class _ExpenScreenState extends State<ExpenScreen> {
  CategoryStrem categoryStrem = CategoryStrem();
  Category? selectedCategory;
  String dateText = 'Select Date';
  @override
  void initState() {
    super.initState();
    getData();

    // Perform one-time initialization tasks here.
    // For example, you can initialize variables, fetch data from the internet, etc.
  }

  void getData() async {
    try {
      final Dio dio = Dio();
      // dio.options.headers['Authorization'] =
      //     'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI2NGM3Mzc5NjVjM2UwYTVjNzY5MzMzMGEiLCJ1c2VyTmFtZSI6bnVsbCwiaWF0IjoxNjkxNDgxNTMwLCJleHAiOjE2OTE0ODUxMzB9._QwBIxwvSCSW7baFaKyusKAQE9yzT-l9nwxJ_jSEq8Y';
      print('start:');
      print('test');
      const uri = 'http://192.168.1.4:5000/auth/googleLogin?googleId=Tanoy888';
      final Response res = await dio.post(uri);
      print("success");
      if (res.statusCode == 200) {
      } else {
        print(res.statusCode);
      }
    } catch (e) {
      print(e);
      print('err');
    }
  }

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
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
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
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
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
                  onPressed: () {},
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

// void saveExpense() async {
//   String date = dateText;
//   String cost = "";
//   String categoryId = "";
//   //   String categoryId = categoryStrem
//   // .selectedCategoryId;
//   String title = "";

//   Map<String, String> body = {
//     "date": date,
//     "cost": cost,
//     "categoryId": categoryId,
//     "title": title,
//   };

//   try {
//     await ExpenseService.saveExpense(body);
//     print(body);
//     // await ExpenseService.saveExpense(body);
//   } catch (e) {
//     debugPrint("API call failed: ${e.toString()}");
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return GestureDetector(
//     onTap: () => FocusScope.of(context).unfocus(),
//     child: Scaffold(
//       appBar: AppBar(
//           title: const Text('Expense Screen'),
//           backgroundColor: const Color.fromRGBO(112, 20, 204, 1)),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: SingleChildScrollView(
//             child: Column(children: [
//           const SizedBox(
//             height: 15,
//           ),

//           // T1 Date
//           InkWell(
//             onTap: () async {
//               DateTime? pickeddate = await showDatePicker(
//                 context: context,
//                 initialDate: DateTime.now(),
//                 firstDate: DateTime(2000),
//                 lastDate: DateTime(2023, 12, 31),
//               );
//               if (pickeddate != null) {
//                 setState(() {
//                   dateText =
//                       DateFormat('dd-MM-yyyy').format(pickeddate).toString();
//                 });
//               }
//             },
//             child: Container(
//               height: 60,
//               width: double.infinity,
//               margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
//               padding: const EdgeInsets.all(8.0),
//               decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(5),
//                   border:
//                       Border.all(color: const Color.fromRGBO(112, 20, 204, 1))),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Icon(Icons.calendar_today),
//                   const SizedBox(
//                     width: 16,
//                   ),
//                   Text(dateText),
//                 ],
//               ),
//             ),
//           ),

//           // T2  Cost
//           InkWell(
//             child: Container(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Cost',
//                         prefixIcon: const Icon(Icons.money),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5),
//                           borderSide: const BorderSide(
//                               width: 1, color: Color.fromRGBO(112, 20, 204, 1)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               width: 1, color: Color.fromRGBO(112, 20, 204, 1)),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                       keyboardType: TextInputType.number,
//                     ),
//                   ),
//                   // Icon(Icons.attach_money),
//                 ],
//               ),
//             ),
//           ),

//           Container(
//             height: 60,
//             width: double.infinity,
//             margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
//             padding: const EdgeInsets.all(8.0),
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5),
//                 border:
//                     Border.all(color: const Color.fromRGBO(112, 20, 204, 1))),
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                   elevation: 0.0,
//                   shadowColor: Colors.transparent,
//                   backgroundColor: Colors.white),
//               onPressed: () {
//                 showModalBottomSheet(
//                   context: context,
//                   builder: (BuildContext context) {
//                     return CategoryItemPage(
//                       onCategorySelected: (category) {
//                         categoryStrem.onCategorySelected(category);
//                       },
//                     );
//                   },
//                 );
//               },
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   const Icon(
//                     Icons.category,
//                     color: Colors.black,
//                   ),
//                   const SizedBox(
//                     width: 16,
//                   ),
//                   StreamBuilder<Category>(
//                       stream: categoryStrem.categoryStremController,
//                       builder: (context, snapshot) {
//                         return Text(
//                           snapshot.hasData
//                               ? snapshot.data?.name ?? ""
//                               : 'No Category Selected',
//                           style: const TextStyle(color: Colors.black),
//                         );
//                       }),
//                 ],
//               ),
//             ),
//           ),

//           // T4
//           InkWell(
//             child: Container(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextFormField(
//                       decoration: InputDecoration(
//                         labelText: 'Title',
//                         prefixIcon: const Icon(Icons.calculate),
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(5),
//                           borderSide: const BorderSide(
//                               width: 1, color: Color.fromRGBO(112, 20, 204, 1)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderSide: const BorderSide(
//                               width: 1, color: Color.fromRGBO(112, 20, 204, 1)),
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                       ),
//                       keyboardType: TextInputType.text,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           Container(
//             width: double.infinity,
//             height: 58,

//             // Color: const Colors.fromRGBO(112, 20, 204, 1)
//             padding: const EdgeInsets.only(
//               left: 12,
//               right: 12,
//             ),
//             margin: const EdgeInsets.only(top: 10),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(17),
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                     elevation: 0.0,
//                     shadowColor: Colors.transparent,
//                     backgroundColor: const Color.fromRGBO(112, 20, 204, 1)),
//                 onPressed: () {},
//                 child: const Text(
//                   'Save',
//                 ),
//               ),
//             ),
//           ),
//         ])),
//       ),
//     ),
//   );

