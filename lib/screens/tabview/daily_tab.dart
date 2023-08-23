import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luno_budget_money/constants/color_contants.dart';

import '../../constants/image_contants.dart';
import '../../models/response_get_category_expense_model.dart';
import '../../routes/routes.dart';
import '../../services/api_delete_expense.dart';
import '../../services/api_get_category_expense.dart';
import '../update_expense_screen.dart';

class DailyTab extends StatefulWidget {
  const DailyTab({super.key});

  @override
  State<DailyTab> createState() => _DailyTabState();
}

class _DailyTabState extends State<DailyTab> {
  List<ResponseGetCategoryExpenseModel> filteredList = [];
  // DateTimeRange dateRange = DateTimeRange(
  //   start: DateTime.now(),
  //   end: DateTime.now(),
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

  @override
  Widget build(BuildContext context) {
    final start = dateRange.start;
    final end = dateRange.end;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 252, 239, 1),
      body: Column(
        children: [
          const SizedBox(height: 15),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text('Start Date'),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await pickDateRange();
                              setState(() {});
                            },
                            child: Text(DateFormat('yyyy/MM/dd').format(start)),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 25, left: 5, right: 5),
                        child: SizedBox(
                          width: 18,
                          child: Divider(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const Text('End Date'),
                          const SizedBox(
                            height: 10,
                          ),
                          ElevatedButton(
                            onPressed: () async {
                              await pickDateRange();
                              setState(() {});
                            },
                            child: Text(DateFormat('yyyy/MM/dd').format(end)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('Date of Category'), Text('Total: 200000')],
                  ),
                ),
                const Divider(
                  color: Colors.black, // Customize the color of the divider
                ),
              ],
            ),
          ),
          // const BuilderExpense(),
          Expanded(
            flex: 5,
            child: FutureBuilder(
              future: ApiGetCategoryExpense().getCategoryExpense(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.colors3,
        onPressed: () {
          Navigator.pushNamed(context, Routes.expensescreen);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }

  Future pickDateRange() async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
      // ignore: prefer_typing_uninitialized_variables
      var snapshot;
      filteredList = snapshot.data
          ?.where((expense) =>
              expense.date.isAfter(dateRange.start) &&
              expense.date.isBefore(dateRange.end))
          .toList();
    });
    setState(() {});
  }
}
