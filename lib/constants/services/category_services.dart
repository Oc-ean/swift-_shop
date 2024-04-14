import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../models/category_model.dart';

class CategoryServices {
  final String baseUrl;

  CategoryServices(this.baseUrl);

  Future<List<CategoryModel>> getCategory() async {
    final response = await http.get(Uri.parse('$baseUrl/category'));
    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      log(data.toString());
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load Category');
    }
  }

  Future<CategoryModel> getCategoryById(String id) async {
    final response = await http.get(Uri.parse('$baseUrl/category/$id'));
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CategoryModel.fromJson(data);
    } else {
      throw Exception('Failed to load Category');
    }
  }

  Future<CategoryModel> createProduct(CategoryModel productModel) async {
    final response = await http.post(
      Uri.parse('$baseUrl/category'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productModel.toJson()),
    );
    if (response.statusCode == 201) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CategoryModel.fromJson(data);
    } else {
      throw Exception('Failed to create category');
    }
  }

  Future<CategoryModel> updateProduct(
      String id, CategoryModel productModel) async {
    final response = await http.put(
      Uri.parse('$baseUrl/category/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(productModel.toJson()),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return CategoryModel.fromJson(data);
    } else {
      throw Exception('Failed to update category');
    }
  }

  Future<bool> deleteProduct(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/category/$id'));
      if (response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Failed to delete category');
      }
    } catch (error) {
      throw Exception('Failed to delete category: $error');
    }
  }
}
