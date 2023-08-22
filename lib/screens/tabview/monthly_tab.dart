import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import '../../constants/color_contants.dart';
import '../../constants/image_contants.dart';
import '../../models/response_get_category_expense_model.dart';
import '../../services/api_delete_expense.dart';
import '../../services/api_get_category_expense.dart';
import '../update_expense_screen.dart';

class MonthlyTab extends StatefulWidget {
  const MonthlyTab({super.key});

  @override
  MonthlyTabState createState() => MonthlyTabState();
}

class MonthlyTabState extends State<MonthlyTab> {
  List<ResponseGetCategoryExpenseModel> filteredList = [];
//   DateTime now = DateTime.now();
// DateTime startOfMonth = DateTime(now.year, now.month, 1);
// DateTime endOfMonth = DateTime(now.year, now.month + 1, 0); // Get the last day of the current month
// DateTimeRange dateRange = DateTimeRange(
//   start: startOfMonth,
//   end: endOfMonth,
// );
  late DateTime startOfMonth;
  late DateTime endOfMonth;
  late DateTimeRange dateRange;
  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    startOfMonth = DateTime(now.year, now.month, 1);
    endOfMonth = DateTime(now.year, now.month + 1, 0);
    dateRange = DateTimeRange(
      start: startOfMonth,
      end: endOfMonth,
    );
  }

  // String dateText = 'Select Date';

  @override
  Widget build(BuildContext context) {
    // final start = dateRange.start;
    // final end = dateRange.end;
    // final difference = dateRange.duration;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('For Month'),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () {
            //           pickDateRange();
            //         },
            //         child: Text(DateFormat('yyyy/MM/dd').format(start)),
            //       ),
            //     ),
            //     const SizedBox(
            //       width: 12,
            //     ),
            //     Expanded(
            //       child: ElevatedButton(
            //         onPressed: () {
            //           pickDateRange();
            //         },
            //         child: Text(DateFormat('yyyy/MM/dd').format(end)),
            //       ),
            //     ),
            //   ],
            // ),
            FutureBuilder(
              future: ApiGetCategoryExpense().getCategoryExpense(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    // Filter expenses based on the selected date range
                    filteredList = snapshot.data!
                        .where((getCategoryExpense) =>
                            getCategoryExpense.date.isAfter(dateRange.start) &&
                            getCategoryExpense.date.isBefore(dateRange.end))
                        .toList();
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: filteredList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            height: 70,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              // color: ColorConstants.colors2,
                              border: Border.all(color: Colors.purple),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            radius: 20,
                                            backgroundColor:
                                                ColorConstants.colors3,
                                            backgroundImage: NetworkImage(
                                                '${ImageConstants.iconCtgLink1}${snapshot.data?[index].category.image}${ImageConstants.iconCtgLink2}')),
                                        Text(
                                          '${snapshot.data?[index].category.categoryName}',
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '${snapshot.data?[index].title}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 10),
                                        Text('${snapshot.data?[index].amount}'),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        UpdateExpenseScreen(
                                                          expenseId: snapshot
                                                              .data![index].id,
                                                          date:
                                                              '${snapshot.data?[index].date}',
                                                          title:
                                                              '${snapshot.data?[index].title}',
                                                          amount:
                                                              "${snapshot.data?[index].amount}",
                                                          categoryId:
                                                              '${snapshot.data?[index].categoryId}',
                                                          categoryname:
                                                              '${snapshot.data?[index].category.categoryName}',
                                                        )));
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            color: ColorConstants.colors3,
                                          )),
                                      IconButton(
                                          onPressed: () async {
                                            await ApiDeleteExpense().deleteData(
                                                id: snapshot.data![index].id);
                                            setState(() {});
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
