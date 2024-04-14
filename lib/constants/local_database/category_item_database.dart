import 'package:hive/hive.dart';

import '../../models/category_item_model.dart';

class CategoryItemDatabase {
  late Box<CategoryItemModel> _categoryItemBox;

  Future<void> init() async {
    _categoryItemBox =
        await Hive.openBox<CategoryItemModel>('CategoryItemModels');
  }

  Future<void> assignCategoryItemModel(
      {required List<CategoryItemModel> categoryItemModel}) async {
    await _categoryItemBox.clear();
    await _categoryItemBox.addAll(categoryItemModel);
  }

  List<CategoryItemModel> getCategories() => _categoryItemBox.values.toList();
}
