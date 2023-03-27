import 'package:flutter/material.dart';
import 'package:themealdb_app/model/meal_detail_model.dart';
import 'package:themealdb_app/screen/search/serach_meal_card.dart';
import 'package:themealdb_app/services/food_order.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  bool isLoading = false;
  List<MealDetailModel> meals = [];
  final searchInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Meal Details",
        ),
      ),
      body: ListView(
        children: [
          TextField(
            controller: searchInputController,
            decoration: InputDecoration(
              hintText: 'Enter Meal Name',
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: searchHanlder,
            child: Text('Search'),
          ),
          Builder(builder: (context) {
            if (isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (meals.length == 0) {
              return Center(
                child: Text('No Meal Found'),
              );
            } else {
              return Column(
                children: meals.map((element) {
                  return SearchMealCard(meal: element);
                }).toList(),
              );
            }
          }),
        ],
      ),
    );
  }

  Future<void> searchHanlder() async {
    final name = searchInputController.text;
    if (name.length == 0) {
      final snackBar = SnackBar(content: Text('Please Enter some text'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      setState(() {
        isLoading = true;
        meals = [];
      });
      final result = await LookupApi.getMealsByName(name);
      setState(() {
        isLoading = false;
        meals = result;
      });
    }
  }
}
