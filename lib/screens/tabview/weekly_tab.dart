import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import '../../constants/color_contants.dart';
import '../../constants/image_contants.dart';
import '../../models/response_get_category_expense_model.dart';
import '../../services/api_delete_expense.dart';
import '../../services/api_get_category_expense.dart';
import '../update_expense_screen.dart';

class WeeklyTab extends StatefulWidget {
  const WeeklyTab({super.key});

  @override
  WeeklyTabState createState() => WeeklyTabState();
}

class WeeklyTabState extends State<WeeklyTab> {
  List<ResponseGetCategoryExpenseModel> filteredList = [];
  // DateTimeRange dateRange = DateTimeRange(
  //   start: DateTime.now(),
  //   end: DateTime.now().add(const Duration(days: 6)),
  // );
  late DateTimeRange dateRange;

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    DateTime startOfWeek = now.subtract(Duration(days: now.weekday - 1));
    dateRange = DateTimeRange(
      start: startOfWeek,
      end: startOfWeek.add(const Duration(days: 7)),
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
            const Text('For Week'),
            FutureBuilder(
              future: ApiGetCategoryExpense().getCategoryExpense(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    // Filter expenses based on the selected date range
                    filteredList = snapshot.data!
                        .where((getCategoryExpense) =>
                            getCategoryExpense.date
                                .toLocal()
                                .isAfter(dateRange.start) &&
                            getCategoryExpense.date
                                .toLocal()
                                .isBefore(dateRange.end))
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
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            IconButton(
                                                onPressed: () async {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              UpdateExpenseScreen(
                                                                expenseId:
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .id,
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
                                                  await ApiDeleteExpense()
                                                      .deleteData(
                                                          id: snapshot
                                                              .data![index].id);
                                                  setState(() {});
                                                },
                                                icon: const Icon(
                                                  Icons.delete,
                                                  color: Colors.red,
                                                )),
                                          ],
                                        ),
                                        Row(children: [
                                          Expanded(
                                            child: Text(
                                              '${snapshot.data?[index].date.toLocal()}',
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ])
                                      ],
                                    ),
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

  // Future pickDateRange() async {
  //   DateTimeRange? newDateRange = await showDateRangePicker(
  //     context: context,
  //     initialDateRange: dateRange,
  //     firstDate: DateTime(1900),
  //     lastDate: DateTime(2100),
  //   );
  //   if (newDateRange == null) return;
  //   setState(() {
  //     dateRange = newDateRange;
  //     var snapshot;
  //     filteredList = snapshot.data
  //         ?.where((expense) =>
  //             expense.date.isAfter(dateRange.start) &&
  //             expense.date.isBefore(dateRange.end))
  //         .toList();
  //   });
  // }
}
