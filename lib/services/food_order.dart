import 'package:themealdb_app/model/meal_detail_model.dart';
import 'package:themealdb_app/utils/api.dart';

class LookupApi {
  static Future<List<MealDetailModel>> getMealsDetailById(String id) async {
    final url = '/lookup.php?i=$id';
    final response = await dioMeal.get(url);
    final json = response.data as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealDetailModel.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<MealDetailModel>> getMealsByName(String name) async {
    final url = '/search.php?s=$name';
    final response = await dioMeal.get(url);
    final json = response.data as Map;
    final meals = json['meals'] as List?;
    if (meals == null) return [];
    final mealObjects = meals.map((element) {
      return MealDetailModel.fromMap(element);
    }).toList();
    return mealObjects;
  }
}
