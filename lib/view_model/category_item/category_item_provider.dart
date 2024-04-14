import 'package:flutter/widgets.dart';
import 'package:swift_shop/constants/local_database/category_item_database.dart';
import 'package:swift_shop/models/category_item_model.dart';

import '../../constants/api_url.dart';
import '../../constants/services/category_item_services.dart';

class CategoryItemProvider extends ChangeNotifier {
  final CategoryItemServices apiService = CategoryItemServices(ApiUrl.baseUrl);
  final CategoryItemDatabase _categoryItemDatabase = CategoryItemDatabase();

  List<CategoryItemModel> categoryItems = [];
  bool isLoading = false;

  Future<void> fetchCategory(String categoryId) async {
    try {
      isLoading = true; // Set isLoading to true when fetching data
      notifyListeners();

      print('Fetching category items...');

      // Try fetching category items from the database first
      await _categoryItemDatabase.init();
      List<CategoryItemModel> categoryItemsDb =
          _categoryItemDatabase.getCategories();

      if (categoryItemsDb.isNotEmpty) {
        print('Category items fetched from cache.');
        categoryItems = categoryItemsDb;
        print('categoryItemDb ==> $categoryItems');
        isLoading = false;
        notifyListeners();
      }

      // If no items found in cache, fetch from the API
      final List<CategoryItemModel> response =
          await apiService.getCategoryItem(categoryId);

      // Update categoryItems with the fetched data
      await _categoryItemDatabase.init();
      await _categoryItemDatabase.assignCategoryItemModel(
          categoryItemModel: response);
      categoryItems = response;
      print('Category items fetched successfully.');
    } catch (error) {
      print('Error fetching category items: $error');
      // Handle error gracefully, you may want to show a snackbar or retry option
    } finally {
      isLoading =
          false; // Set isLoading to false regardless of success or failure
      notifyListeners();
    }
  }
}
