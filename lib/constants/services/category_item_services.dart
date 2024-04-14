import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:swift_shop/models/category_item_model.dart';

// class CategoryItemServices {
//   final String baseUrl;
//
//   CategoryItemServices(this.baseUrl);
//
//   Future<List<CategoryItemModel>> getCategoryItem(String categoryId) async {
//     try {
//       final response = await http.get(Uri.parse(
//           '$baseUrl/items${categoryId != null ? '?categoryId=$categoryId' : ''}'));
//       print('Response body: ${response.body}');
//
//       if (response.statusCode == 200) {
//         final List<dynamic> data = jsonDecode(response.body);
//         print('Parsed JSON data:');
//         for (var json in data) {
//           final item = CategoryItemModel.fromJson(json);
//           print(item);
//         }
//         return data.map((json) => CategoryItemModel.fromJson(json)).toList();
//       } else {
//         throw Exception(
//             'Failed to load items. Status code: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error fetching category items: $error');
//       rethrow;
//     }
//   }
//
//   Future<CategoryItemModel> getCategoryItemById(String id) async {
//     final response = await http.get(Uri.parse('$baseUrl/items/$id'));
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       return CategoryItemModel.fromJson(data);
//     } else {
//       throw Exception('Failed to load items');
//     }
//   }
//
//   Future<CategoryItemModel> createItem(CategoryItemModel productModel) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/items'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(productModel.toJson()),
//     );
//     if (response.statusCode == 201) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       return CategoryItemModel.fromJson(data);
//     } else {
//       throw Exception('Failed to create items');
//     }
//   }
//
//   Future<CategoryItemModel> updateItemById(
//       String id, CategoryItemModel productModel) async {
//     final response = await http.put(
//       Uri.parse('$baseUrl/items/$id'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode(productModel.toJson()),
//     );
//     if (response.statusCode == 200) {
//       final Map<String, dynamic> data = jsonDecode(response.body);
//       return CategoryItemModel.fromJson(data);
//     } else {
//       throw Exception('Failed to update items');
//     }
//   }
//
//   Future<bool> deleteItem(String id) async {
//     try {
//       final response = await http.delete(Uri.parse('$baseUrl/items/$id'));
//       if (response.statusCode == 204) {
//         return true;
//       } else {
//         throw Exception('Failed to delete items');
//       }
//     } catch (error) {
//       throw Exception('Failed to delete items: $error');
//     }
//   }
// }

class CategoryItemServices {
  final String baseUrl;

  CategoryItemServices(this.baseUrl);

  Future<List<CategoryItemModel>> getCategoryItem(String categoryId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/items?categoryId=$categoryId'),
      );
      print('Hello ====>  ' '$baseUrl/items?categoryId=$categoryId');
      print('Response body: ${response.body}');

      List<CategoryItemModel> myList = [];

      if (response.statusCode == 200) {
        final List<dynamic> tempList = jsonDecode(response.body);

        // Iterate through each item in the list
        for (var item in tempList) {
          // Parse each item into CategoryItemModel and add to myList
          myList.add(CategoryItemModel.fromJson(item));
        }
        return myList; // Return populated list
      } else {
        throw Exception(
            'Failed to load items. Status code: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching category items: $error');
      rethrow;
    }
  }

  Future<CategoryItemModel> getCategoryItemById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/items/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CategoryItemModel.fromJson(data);
    } else {
      throw Exception('Failed to load items');
    }
  }

  Future<CategoryItemModel> createItem(CategoryItemModel productModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/items'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productModel.toJson()),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CategoryItemModel.fromJson(data);
    } else {
      throw Exception('Failed to create items');
    }
  }

  Future<CategoryItemModel> updateItemById(
      String id, CategoryItemModel productModel) async {
    final response = await http.put(
      Uri.parse('$baseUrl/items/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productModel.toJson()),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CategoryItemModel.fromJson(data);
    } else {
      throw Exception('Failed to update items');
    }
  }

  Future<bool> deleteItem(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/items/$id'));
      if (response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Failed to delete items');
      }
    } catch (error) {
      throw Exception('Failed to delete items: $error');
    }
  }
}
