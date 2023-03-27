import 'package:flutter/material.dart';
import 'package:themealdb_app/model/meal_modal.dart';
import 'package:themealdb_app/screen/meal_detail/meal_detail.dart';
import 'package:themealdb_app/widgets/meal_image.dart';

class MealCard extends StatelessWidget {
  const MealCard({
    super.key,
    required this.meal,
  });
  final MealModal meal;

  @override
  Widget build(BuildContext context) {
    final image = meal.strMealThumb;
    final mealId = meal.idMeal;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            final route = MaterialPageRoute(
              builder: (context) => MealDetailPage(mealId: mealId),
            );
            Navigator.push(context, route);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MealImage(
                height: 200,
                width: double.maxFinite,
                url: image,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  meal.strMeal,
                  style: TextStyle(fontSize: 30),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
