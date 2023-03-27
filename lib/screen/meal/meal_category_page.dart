import 'package:flutter/material.dart';
import 'package:themealdb_app/model/meal_modal.dart';
import 'package:themealdb_app/screen/meal/widget/meal_card.dart';
import 'package:themealdb_app/services/filter_api.dart';

class MealCategoryPage extends StatefulWidget {
  const MealCategoryPage({
    super.key,
    required this.name,
  });
  final String name;

  @override
  State<MealCategoryPage> createState() => _MealCategoryPageState();
}

class _MealCategoryPageState extends State<MealCategoryPage> {
  List<MealModal> meals = [];

  @override
  void initState() {
    super.initState();
    fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.name}'),
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

  Future<void> fetchCategory() async {
    final name = widget.name;
    final result = await FilterApi.getMealByCategory(name);
    setState(() {
      meals = result;
    });
  }
}
