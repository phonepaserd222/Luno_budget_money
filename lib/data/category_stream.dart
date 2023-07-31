import 'dart:async';

import 'package:luno_budget_money/model/data.dart';

class CategoryStrem {
  final StreamController<Category> _categoryStremController =
      StreamController<Category>();

  Stream<Category> get categoryStremController =>
      _categoryStremController.stream;

  void onCategorySelected(Category category) {
    _categoryStremController.sink.add(category);
  }

  void onDispose() {
    _categoryStremController.close();
  }
}
