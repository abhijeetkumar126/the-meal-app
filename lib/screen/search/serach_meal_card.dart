import 'package:flutter/material.dart';
import 'package:themealdb_app/model/meal_detail_model.dart';
import 'package:themealdb_app/widgets/meal_image.dart';

class SearchMealCard extends StatelessWidget {
  const SearchMealCard({
    super.key,
    required this.meal,
  });

  final MealDetailModel meal;

  @override
  Widget build(BuildContext context) {
    final name = meal.strMeal;
    final category = meal.strCategory;
    final image = meal.strMealThumb;
    final area = meal.strArea;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MealImage(
              url: image,
              height: 200,
              width: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dish Name : ${name}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    'Made with : ${category}',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Made by : ${area}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
