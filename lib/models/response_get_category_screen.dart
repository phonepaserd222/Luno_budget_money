class ResponseGetCategoryScreen {
  final String categoryName;
  final String image;
  // final String color;
  ResponseGetCategoryScreen({
    required this.categoryName,
    required this.image,
    // required this.color,
  });
  factory ResponseGetCategoryScreen.fromJson(Map<String, dynamic> json) =>
      ResponseGetCategoryScreen(
        categoryName: json["categoryName"],
        image: json["image"],
        // color: json["color"],
      );
}
