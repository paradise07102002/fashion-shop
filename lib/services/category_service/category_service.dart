import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fashion_shop/models/category_model/get_category.dart' as CategoryModel;

class CategoryService {

  Future<List<CategoryModel.Result>> fetchCategories() async {

    final response = await http.get(Uri.parse('http://10.0.2.2:5117/api/Category'));

    try {
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = json.decode(response.body);
        final List<dynamic> resultList = jsonData['result'];
        return resultList.map((json) => CategoryModel.Result.fromJson(json)).toList();
      } else {
        // debugPrint('Failed to load Categories: ${response.statusCode}');
        throw Exception('Failed to load Categories: ${response.statusCode}');
      }
    } catch (e) {
      // debugPrint('Failed to load Caategories: ${response.statusCode}');
      throw Exception('Failed to load Categories: ${response.statusCode}');
    }
  }
}