import 'package:flutter/material.dart';
import 'package:luno_budget_money/constants/color_contants.dart';
import 'package:luno_budget_money/services/api_delete_expense.dart';

import '../../constants/image_contants.dart';
import '../../routes/routes.dart';
import '../../services/api_get_category_expense.dart';
import '../update_expense_screen.dart';

class DailyTab extends StatefulWidget {
  const DailyTab({super.key});

  @override
  State<DailyTab> createState() => _DailyTabState();
}

class _DailyTabState extends State<DailyTab> {
  // void deleteCategory(int index) {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 252, 239, 1),
      body: Column(
        children: [
          const SizedBox(height: 15),
          SizedBox(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          const Text('Start Date'),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            color: Colors.white,
                            height: 44,
                            width: 95,
                            child: TextFormField(
                              // controller: iconNameController,
                              decoration: InputDecoration(
                                // labelText: 'Email',
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 5, top: 5, right: 5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  // ignore: prefer_const_constructors

                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: const BorderSide(
                                      width: 1, color: ColorConstants.colors4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: ColorConstants.colors4),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
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
                          Container(
                            color: Colors.white,
                            height: 44,
                            width: 95,
                            child: TextFormField(
                              // controller: iconNameController,
                              decoration: InputDecoration(
                                // labelText: 'Email',
                                suffixIcon: const Padding(
                                  padding: EdgeInsets.only(
                                      bottom: 5, top: 5, right: 5),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  // ignore: prefer_const_constructors

                                  borderRadius: BorderRadius.circular(3),
                                  borderSide: const BorderSide(
                                      width: 1, color: ColorConstants.colors4),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      width: 1, color: ColorConstants.colors4),
                                  borderRadius: BorderRadius.circular(3),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Container(
                        width: 95,
                        height: 44,
                        margin: const EdgeInsets.only(top: 25),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0.0,
                                shadowColor: Colors.transparent,
                                backgroundColor:
                                    const Color.fromRGBO(152, 111, 249, 1)),
                            onPressed: () {},
                            child: const Text(
                              'Search',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(28),
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
          Expanded(
            flex: 2,
            child: FutureBuilder(
              future: ApiGetCategoryExpense().getCategoryExpense(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
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
                                          style: TextStyle(
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
                                        // Row(
                                        //   children: [
                                        //     Text(
                                        //         '${snapshot.data?[index].date}')
                                        //   ],
                                        // ),
                                        // const SizedBox(height: 10),
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
          )
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
}
