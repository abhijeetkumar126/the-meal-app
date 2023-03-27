import 'dart:convert';

import 'package:themealdb_app/model/area_model.dart';
import 'package:themealdb_app/model/category_modal.dart';
import 'package:themealdb_app/model/ingrient_modal.dart';
import 'package:http/http.dart' as http;

class ListApi {
  static Future<List<IngrientModal>> getAllIngridents() async {
    final url = 'https://www.themealdb.com/api/json/v1/1/list.php?i=list';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as Map;
    final meals = json['meals'] as List;
    final mealObjects = meals.map((element) {
      return IngrientModal.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<AreaModel>> getArea() async {
    final url = 'https://www.themealdb.com/api/json/v1/1/list.php?a=list';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as Map;
    final meals = json['meals'] as List;
    final mealObjects = meals.map((element) {
      return AreaModel.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<CategoryModal>> getCategory() async {
    final url = 'https://www.themealdb.com/api/json/v1/1/list.php?c=list';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as Map;
    final meals = json['meals'] as List;
    final mealObjects = meals.map((element) {
      return CategoryModal.fromMap(element);
    }).toList();
    return mealObjects;
  }
}
