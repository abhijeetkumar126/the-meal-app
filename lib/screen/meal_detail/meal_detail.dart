import 'package:flutter/material.dart';
import 'package:themealdb_app/model/meal_detail_model.dart';
import 'package:themealdb_app/services/food_order.dart';
import 'package:themealdb_app/widgets/meal_image.dart';

class MealDetailPage extends StatefulWidget {
  const MealDetailPage({
    super.key,
    required this.mealId,
  });
  final String mealId;

  @override
  State<MealDetailPage> createState() => _MealDetailPageState();
}

class _MealDetailPageState extends State<MealDetailPage> {
  MealDetailModel? mealDetail;

  @override
  void initState() {
    super.initState();
    fetchMealDetail();
  }

  @override
  Widget build(BuildContext context) {
    final image = mealDetail?.strMealThumb;
    final name = mealDetail?.strMeal;
    final instructions = mealDetail?.strInstructions;
    final category = mealDetail?.strCategory;
    final area = mealDetail?.strArea;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meal Details",
        ),
      ),
      body: ListView(
        children: [
          MealImage(
            height: 360,
            width: double.maxFinite,
            url: image,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    name ?? "Meal Name",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text('Category : '),
                    Text(
                      category ?? "Meal Category",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text("Dish start by : "),
                    Text(
                      area ?? "Meal Area",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  instructions ?? "Meal Details",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> fetchMealDetail() async {
    final id = widget.mealId;
    final result = await LookupApi.getMealsDetailById(id);
    if (result.length == 1) {
      setState(() {
        mealDetail = result[0];
      });
    } else {
      final snackBar = SnackBar(content: Text('Something went wrong'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
