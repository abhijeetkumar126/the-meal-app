import 'package:flutter/material.dart';
import 'package:themealdb_app/model/meal_modal.dart';
import 'package:themealdb_app/services/filter_api.dart';
import 'package:themealdb_app/screen/meal/widget/meal_card.dart';

class MealIngridentPage extends StatefulWidget {
  const MealIngridentPage({
    super.key,
    required this.name,
  });

  final String name;

  @override
  State<MealIngridentPage> createState() => _MealIngridentPageState();
}

class _MealIngridentPageState extends State<MealIngridentPage> {
  List<MealModal> meals = [];

  @override
  void initState() {
    super.initState();
    fetchMealDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal using ${widget.name}'),
      ),
      body: ListView.builder(
        itemCount: meals.length,
        itemBuilder: (context, index) {
          final element = meals[index];
          return MealCard(meal: element);
        },
      ),
    );
  }

  Future<void> fetchMealDetails() async {
    final name = widget.name;
    final result = await FilterApi.getMealByIngrident(name);
    setState(() {
      meals = result;
    });
  }
}
