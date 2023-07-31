import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;
  final Color color;

  Category({required this.name, required this.icon, required this.color});
}

List<Category> categories = [
  Category(name: "Food", icon: Icons.fastfood, color: Colors.blue),
  Category(
      name: "Transportation", icon: Icons.directions_car, color: Colors.green),
  Category(name: "Shopping", icon: Icons.shopping_cart, color: Colors.orange),
  Category(name: "Entertainment", icon: Icons.movie, color: Colors.purple),
  // Add more categories as needed
];
