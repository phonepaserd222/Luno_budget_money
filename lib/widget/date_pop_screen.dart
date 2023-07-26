import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  Category({required this.name, required this.icon, required this.color});
}

class CategoryItemPage extends StatelessWidget {
  final List<Category> categories = [
    Category(name: "Food", icon: Icons.fastfood, color: Colors.blue),
    Category(
        name: "Transportation",
        icon: Icons.directions_car,
        color: Colors.green),
    Category(name: "Shopping", icon: Icons.shopping_cart, color: Colors.orange),
    Category(name: "Entertainment", icon: Icons.movie, color: Colors.purple),

    // Add more categories as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Categories")),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return _buildCategoryCard(categories[index]);
        },
      ),
    );
  }

  Widget _buildCategoryCard(Category category) {
    return Card(
      color: category.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: InkWell(
        onTap: () {
          // Handle category selection here, e.g., navigate to another page
          print("Category selected: ${category.name}");
        },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                size: 40,
                color: Colors.white,
              ),
              SizedBox(height: 8.0),
              Text(
                category.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
