import 'dart:convert';

import 'package:themealdb_app/model/meal_detail_model.dart';
import 'package:http/http.dart' as http;

class LookupApi {
  static Future<List<MealDetailModel>> getMealsDetailById(String id) async {
    final url = 'https://www.themealdb.com/api/json/v1/1/lookup.php?i=$id';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealDetailModel.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<MealDetailModel>> getMealsByName(String name) async {
    final url = 'https://www.themealdb.com/api/json/v1/1/search.php?s=$name';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealDetailModel.fromMap(element);
    }).toList();
    return mealObjects;
  }
}
