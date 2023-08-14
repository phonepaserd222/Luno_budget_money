import 'dart:async';
import '../models/response_get_category_screen.dart';

class CategoryStrem {
  final StreamController<ResponseGetCategoryModel> _categoryStremController =
      StreamController<ResponseGetCategoryModel>();

  Stream<ResponseGetCategoryModel> get categoryStremController =>
      _categoryStremController.stream;

  void onCategorySelected(ResponseGetCategoryModel category) {
    _categoryStremController.sink.add(category);
  }

  void onDispose() {
    _categoryStremController.close();
  }
}
