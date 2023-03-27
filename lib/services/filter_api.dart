import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:themealdb_app/model/meal_modal.dart';

class FilterApi {
  static Future<List<MealModal>> getMealByIngrident(String ingrident) async {
    final url = 'https://themealdb.com/api/json/v1/1/filter.php?i=$ingrident';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealModal.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<MealModal>> getMealByArea(String area) async {
    final url = 'https://themealdb.com/api/json/v1/1/filter.php?a=$area';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealModal.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<MealModal>> getMealByCategory(String category) async {
    final url = 'https://themealdb.com/api/json/v1/1/filter.php?c=$category';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body) as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealModal.fromMap(element);
    }).toList();
    return mealObjects;
  }
}
