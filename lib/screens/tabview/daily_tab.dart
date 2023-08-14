import 'package:flutter/material.dart';

import '../../constants/image_contants.dart';
import '../../routes/routes.dart';
import '../../services/api_get_category_expense.dart';

class DailyTab extends StatelessWidget {
  const DailyTab({super.key});
  // void deleteCategory(int index) {
  //   // Make sure you have access to the 'categories' list and modify it accordingly
  //   categories.removeAt(index);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 226, 184),
      body: Column(
        children: [
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
                            width: 95,
                            height: 44,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(112, 20, 204, 1))),
                          )
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(5),
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
                            width: 95,
                            height: 44,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    color:
                                        const Color.fromRGBO(112, 20, 204, 1))),
                          )
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
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: ApiGetCategoryExpense().getCategoryExpense(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 70,
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
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CircleAvatar(
                                            radius: 15,
                                            backgroundColor: Colors.amber,
                                            backgroundImage: NetworkImage(
                                                '${ImageConstants.iconCtgLink1}${snapshot.data?[index].category.image}${ImageConstants.iconCtgLink2}')),
                                        Text(
                                            '${snapshot.data?[index].category.categoryName}'),
                                      ],
                                    ),
                                    const SizedBox(
                                      width: 50,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                                '${snapshot.data?[index].date}')
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          children: [
                                            // const SizedBox(width: 50),
                                            Text(
                                                '${snapshot.data?[index].title}'),
                                            const SizedBox(width: 50),
                                            Text(
                                                '${snapshot.data?[index].amount}'),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Column(children: [
                                      IconButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('Delete ?'),
                                                actions: [
                                                  MaterialButton(
                                                    child: const Text('No'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  MaterialButton(
                                                    child: const Text('Yes'),
                                                    onPressed: () {
                                                      // Call the deleteCategory function to remove the item from the list
                                                      // deleteCategory(index);
                                                      Navigator.of(context)
                                                          .pop();
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
                                    ]),
                                  ],
                                ),
                              ),
                            ],
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
