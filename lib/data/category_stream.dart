import 'dart:async';
import 'package:luno_budget_money/models/response_get_category_find_many_model.dart';

class CategoryStrem {
  final StreamController<ResponseGetCategoryFindManyModel>
      _categoryStremController =
      StreamController<ResponseGetCategoryFindManyModel>();

  Stream<ResponseGetCategoryFindManyModel> get categoryStremController =>
      _categoryStremController.stream;

  void onCategorySelected(ResponseGetCategoryFindManyModel category) {
    _categoryStremController.sink.add(category);
  }

  void onDispose() {
    _categoryStremController.close();
  }
}
