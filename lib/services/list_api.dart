import 'package:themealdb_app/model/area_model.dart';
import 'package:themealdb_app/model/category_modal.dart';
import 'package:themealdb_app/model/ingrient_modal.dart';
import 'package:themealdb_app/utils/api.dart';

class ListApi {
  static Future<List<IngrientModal>> getAllIngridents() async {
    final url = '/list.php?i=list';
    final response = await dioMeal.get(url);
    final json = response.data as Map;
    final meals = json['meals'] as List;
    final mealObjects = meals.map((element) {
      return IngrientModal.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<AreaModel>> getArea() async {
    final url = '/list.php?a=list';
    final response = await dioMeal.get(url);
    final json = response.data as Map;
    final meals = json['meals'] as List;
    final mealObjects = meals.map((element) {
      return AreaModel.fromMap(element);
    }).toList();
    return mealObjects;
  }

  static Future<List<CategoryModal>> getCategory() async {
    final url = '/list.php?c=list';
    final response = await dioMeal.get(url);
    final json = response.data as Map;
    final meals = json['meals'] as List;
    final mealObjects = meals.map((element) {
      return CategoryModal.fromMap(element);
    }).toList();
    return mealObjects;
  }
}
