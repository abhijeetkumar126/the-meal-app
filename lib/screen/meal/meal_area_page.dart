import 'package:flutter/material.dart';
import 'package:themealdb_app/model/meal_modal.dart';
import 'package:themealdb_app/screen/meal/widget/meal_card.dart';
import 'package:themealdb_app/services/filter_api.dart';

class MealAreaPage extends StatefulWidget {
  const MealAreaPage({
    super.key,
    required this.name,
  });
  final String name;

  @override
  State<MealAreaPage> createState() => _MealAreaPageState();
}

class _MealAreaPageState extends State<MealAreaPage> {
  List<MealModal> meals = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchMealArea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name} Meal'),
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

  Future<void> fetchMealArea() async {
    final name = widget.name;
    final result = await FilterApi.getMealByArea(name);
    setState(() {
      meals = result;
    });
  }
}
