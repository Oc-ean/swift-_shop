import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:swift_shop/constants/api_url.dart';
import 'package:swift_shop/constants/services/category_services.dart';
import 'package:swift_shop/models/category_model.dart';

import '../../constants/local_database/category_database.dart';

class CategoryProvider extends ChangeNotifier {
  final CategoryServices apiService = CategoryServices(ApiUrl.baseUrl);
  final CategoryDatabase _categoryDatabase = CategoryDatabase();
  List<CategoryModel> category = [];

  Future<void> fetchCategory() async {
    try {
      print('Fetching products...');
      // Fetch categories from API
      List<CategoryModel> fetchedCategories = await apiService.getCategory();
      print('Category fetched successfully.');
      log('Category Lists $fetchedCategories');

      // Save categories to database
      await _categoryDatabase.init();
      await _categoryDatabase.assignCategoryModel(
          categoryModel: fetchedCategories);

      // Update category list
      category = fetchedCategories;
    } catch (error) {
      log('Error fetching products: $error');
    }
    notifyListeners();
  }

  Future<void> fetchCategoryFromDb() async {
    try {
      // Fetch categories from database
      await _categoryDatabase.init();
      category = _categoryDatabase.getCategories();
      print('Displaying category from database');
      print('categoryDb ==> $category');
    } catch (error) {
      log('Error fetching cached categories: $error');
    }
    notifyListeners();
  }
}
