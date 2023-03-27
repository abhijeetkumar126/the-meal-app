import 'package:flutter/material.dart';
import 'package:themealdb_app/model/category_modal.dart';
import 'package:themealdb_app/screen/home/widget/simple_card.dart';
import 'package:themealdb_app/screen/meal/meal_category_page.dart';
import 'package:themealdb_app/services/list_api.dart';

class CategoryBody extends StatefulWidget {
  const CategoryBody({super.key});

  @override
  State<CategoryBody> createState() => _CategoryBodyState();
}

class _CategoryBodyState extends State<CategoryBody> {
  List<CategoryModal> categories = [];

  @override
  void initState() {
    super.initState();
    fetchCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return SimpleCard(
            title: category.strCategory,
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) =>
                    MealCategoryPage(name: category.strCategory),
              );
              Navigator.push(context, route);
            },
          );
        },
      ),
    );
  }

  Future<void> fetchCategory() async {
    final result = await ListApi.getCategory();
    setState(() {
      categories = result;
    });
  }
}
