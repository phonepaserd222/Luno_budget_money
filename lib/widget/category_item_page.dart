import 'package:flutter/material.dart';
import '../constants/image_contants.dart';
import '../models/response_get_category_screen.dart';
import '../services/api_get_category.dart';
import '../services/category_expense_service.dart';

class CategoryItemPage extends StatelessWidget {
  final void Function(ResponseGetCategoryModel category) onCategorySelected;

  const CategoryItemPage({super.key, required this.onCategorySelected});

  void saveExpense() async {
    String date = 'dateText';
    String cost = "";
    String categoryId = "";
    //   String categoryId = categoryStrem
    // .selectedCategoryId;
    String title = "";

    Map<String, String> body = {
      "date": date,
      "cost": cost,
      "categoryId": categoryId,
      "title": title,
    };

    try {
      await ExpenseService.saveExpense(body);
      // print(body);
      // await ExpenseService.saveExpense(body);
    } catch (e) {
      debugPrint("API call failed: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        backgroundColor: const Color.fromRGBO(112, 20, 204, 1),
      ),
      body: FutureBuilder<List<ResponseGetCategoryModel>>(
        future: ApiGetCategory().getCategory(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return _buildCategoryCard(context, snapshot.data![index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  void _onCategorySelected(
      ResponseGetCategoryModel category, BuildContext context) {
    onCategorySelected(category); // Call the callback function
    Navigator.pop(context); // Close the bottom sheet after selecting a category
  }

  Widget _buildCategoryCard(
      BuildContext context, ResponseGetCategoryModel category) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black),
        ),
        child: InkWell(
          onTap: () {
            saveExpense();
            _onCategorySelected(category, context);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                      height: 100,
                      width: 100,
                      child: Image.network(
                          '${ImageConstants.iconCtgLink1}${category.image}${ImageConstants.iconCtgLink2}')),
                ),
                Text(
                  category.categoryName,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
