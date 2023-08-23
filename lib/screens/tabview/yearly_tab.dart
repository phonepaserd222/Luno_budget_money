import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

import '../../constants/color_contants.dart';
import '../../constants/image_contants.dart';
import '../../models/response_get_category_expense_model.dart';
import '../../services/api_delete_expense.dart';
import '../../services/api_get_category_expense.dart';
import '../update_expense_screen.dart';

class YearlyTab extends StatefulWidget {
  const YearlyTab({super.key});

  @override
  YearlyTabState createState() => YearlyTabState();
}

DateTime getCustomStartDate(int desiredYear) {
  return DateTime(desiredYear, 1, 1);
}

class YearlyTabState extends State<YearlyTab> {
  List<ResponseGetCategoryExpenseModel> filteredList = [];

  late DateTimeRange dateRange;

  @override
  void initState() {
    super.initState();

    int desiredYear = 2023;
    DateTime customStartDate = getCustomStartDate(desiredYear);
    dateRange = DateTimeRange(
      start: customStartDate,
      end: customStartDate
          .add(const Duration(days: 365)), // Assuming non-leap year
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('For Year'),
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
}
