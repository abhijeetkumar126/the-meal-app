import 'package:themealdb_app/model/meal_modal.dart';
import 'package:themealdb_app/utils/api.dart';

class FilterApi {
  static Future<List<MealModal>> getMealByIngrident(String ingrident) async {
    final url = '/filter.php?i=$ingrident';
    final response = await dioMeal.get(url);
    final json = response.data as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealModal.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<MealModal>> getMealByArea(String area) async {
    final url = '/filter.php?a=$area';
    final response = await dioMeal.get(url);
    final json = response.data as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealModal.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<MealModal>> getMealByCategory(String category) async {
    final url = '/filter.php?c=$category';
    final response = await dioMeal.get(url);
    final json = response.data as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealModal.fromMap(element);
    }).toList();
    return mealObjects;
  }
}
