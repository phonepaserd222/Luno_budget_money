import 'package:flutter/material.dart';
import 'package:luno_budget_money/models/data.dart';

import '../services/category_expense_service.dart';

class CategoryItemPage extends StatelessWidget {
  final void Function(Category category) onCategorySelected;

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
      (body);
      // await ExpenseService.saveExpense(body);
    } catch (e) {
      debugPrint("API call failed: ${e.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: const Color.fromRGBO(112, 20, 204, 1),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(context, categories[index]);
        },
      ),
    );
  }

  void _onCategorySelected(Category category, BuildContext context) {
    onCategorySelected(category); // Call the callback function
    Navigator.pop(context); // Close the bottom sheet after selecting a category
  }

  Widget _buildCategoryCard(BuildContext context, Category category) {
    return Padding(
      padding: EdgeInsets.all(2),
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
                Icon(category.icon,
                    size: 30, color: Color.fromRGBO(112, 20, 204, 1)),
                SizedBox(height: 8.0),
                Text(
                  category.name,
                  style: TextStyle(
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
