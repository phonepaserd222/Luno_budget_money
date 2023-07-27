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
    Category(name: "Food", icon: Icons.fastfood, color: Colors.blue),
    Category(
        name: "Transportation",
        icon: Icons.directions_car,
        color: Colors.green),
    Category(name: "Shopping", icon: Icons.shopping_cart, color: Colors.orange),
    Category(name: "Entertainment", icon: Icons.movie, color: Colors.purple),
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

  Widget _buildCategoryCard(BuildContext context, Category category) {
    return Container(
      width: 100,
      height: 50,
      color: category.color,
      child: InkWell(
        // onTap: () {
        //   // Show the alert when a category is tapped

        //   print("Category selected: ${category.name}");
        // },
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                category.icon,
                size: 30,
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
