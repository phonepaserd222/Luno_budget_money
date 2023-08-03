import 'package:flutter/material.dart';
import 'package:luno_budget_money/model/data.dart';

// import 'package:luno_budget_money/screens/expense_screen.dart';

class CategoryItemPage extends StatelessWidget {
  final void Function(Category category) onCategorySelected;

  const CategoryItemPage({super.key, required this.onCategorySelected});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Categories'),
          backgroundColor: const Color.fromRGBO(112, 20, 204, 1)),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // Number of columns in the grid
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
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
    return Expanded(
      child: Container(
        // margin: EdgeInsets.all(5),
        color: category.color,
        child: InkWell(
          onTap: () {
            _onCategorySelected(category, context);
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  category.icon,
                  size: 30,
                  color: Colors.white,
                ),
                const SizedBox(height: 8.0),
                Text(
                  category.name,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
