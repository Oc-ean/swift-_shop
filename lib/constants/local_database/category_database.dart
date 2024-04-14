import 'package:hive/hive.dart';

import '../../models/category_model.dart';

class CategoryDatabase {
  late Box<CategoryModel> _categoryBox;

  Future<void> init() async {
    _categoryBox = await Hive.openBox<CategoryModel>('CategoryModels');
  }

  Future<void> assignCategoryModel(
      {required List<CategoryModel> categoryModel}) async {
    await _categoryBox.clear();
    await _categoryBox.addAll(categoryModel);
  }

  List<CategoryModel> getCategories() => _categoryBox.values.toList();
}
