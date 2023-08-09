import 'package:flutter/material.dart';

import '../models/data.dart';

class ShowCategory extends StatelessWidget {
  const ShowCategory({
    Key? key,
    required this.name,
    required this.icon,
  }) : super(key: key);

  final String name;
  final IconData icon;

  void deleteCategory(int index) {
    categories.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: Colors.purple),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Icon(
                              categories[index]
                                  .icon, // Use categories[index].icon
                              size: 30,
                              color: const Color.fromRGBO(112, 20, 204, 1),
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              categories[index]
                                  .name, // Use categories[index].name
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
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
                                      // Call the deleteCategory function to remove the item from the list
                                      deleteCategory(index);
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
        ],
      ),
    );
  }
}
