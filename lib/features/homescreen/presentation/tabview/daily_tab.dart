import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:luno_budget_money/constants/color_contants.dart';
import '../../../../constants/image_contants.dart';
import '../../data/model/response_get_report_expense_model.dart';
import '../../../../routes/routes.dart';

import '../../data/service/format_date_time.dart';
import '../../../expense/presentation/update_expense_screen.dart';
import '../../data/service/api_delete_expense.dart';
import '../../data/service/api_report_expense.dart';

class DailyTab extends StatefulWidget {
  const DailyTab({super.key});

  @override
  State<DailyTab> createState() => _DailyTabState();
}

class _DailyTabState extends State<DailyTab> {
  List<ResponseGetReportExpenseModel> filteredList = [];
  late DateTime startOfMonth;
  late DateTime endOfMonth;
  late DateTimeRange dateRange;
  double totalAmount = 0;

  @override
  void initState() {
    super.initState();

    DateTime now = DateTime.now();
    startOfMonth = DateTime(
      now.year,
      now.month,
    );
    endOfMonth = DateTime(now.year, now.month + 1, 0);
    dateRange = DateTimeRange(
      start: startOfMonth,
      end: DateTime.now(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final noww = DateTime.now();
    final formatter = DateFormat('dd/MM/yyyy');
    final formattedDate = formatter.format(noww);
    final start = dateRange.start;
    final end = dateRange.end;
    return Scaffold(
      backgroundColor: ColorConstants.bgwhite,
      body: Column(
        children: [
          // const SizedBox(height: 15),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Text(
                          'Start Date',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          child: Text(DateFormat('yyyy/MM/dd').format(start)),
                          onPressed: () async {
                            await pickDateRange();
                            setState(() {});
                          },
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
                        const Text(
                          'End Date',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          child: Text(DateFormat('yyyy/MM/dd').format(end)),
                          onPressed: () async {
                            await pickDateRange();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Column(
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            resetDateRange();
                          },
                          child: const Icon(
                            Icons.refresh,
                            color: ColorConstants.bgwhite,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 28, right: 28),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formattedDate,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Colors.black, // Customize the color of the divider
              ),
            ],
          ),
          Expanded(
            flex: 6,
            child: FutureBuilder(
              future: ApiReportExpense().reportExpense(
                  startDate:
                      FormatDateTime.formatDate(dateRange.start.toString()),
                  endDate: FormatDateTime.formatDate(dateRange.end.toString())),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  filteredList = snapshot.data!
                      .where((reportExpense) =>
                          reportExpense.date
                              .toLocal()
                              .isAfter(dateRange.start) &&
                          reportExpense.date.toLocal().isBefore(dateRange.end))
                      .toList();

                  // Reset totalAmount before calculating
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      totalAmount += snapshot.data![index].amount;
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 5, right: 15),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                FormatDateTime.formatDate(
                                                    '${snapshot.data?[index].date.toLocal()}'),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
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

  void resetDateRange() {
    setState(() {
      dateRange = DateTimeRange(
        start: startOfMonth,
        end: DateTime.now(),
      );
    });
  }

  Future pickDateRange(
      // {required Function(DateTimeRange value) onSelect}
      ) async {
    DateTimeRange? newDateRange = await showDateRangePicker(
      context: context,
      initialDateRange: dateRange,
      firstDate: DateTime(1998),
      lastDate: DateTime(2099),
    );
    if (newDateRange == null) return;
    setState(() {
      dateRange = newDateRange;
    });
  }
}