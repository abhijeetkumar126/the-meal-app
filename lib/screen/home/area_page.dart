import 'package:flutter/material.dart';
import 'package:themealdb_app/model/area_model.dart';
import 'package:themealdb_app/screen/home/widget/simple_card.dart';
import 'package:themealdb_app/screen/meal/meal_area_page.dart';
import 'package:themealdb_app/services/list_api.dart';

class AreaBody extends StatefulWidget {
  const AreaBody({super.key});

  @override
  State<AreaBody> createState() => _AreaBodyState();
}

class _AreaBodyState extends State<AreaBody> {
  List<AreaModel> areas = [];

  @override
  void initState() {
    super.initState();
    fetchArea();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: areas.length,
        itemBuilder: (context, index) {
          final area = areas[index];
          return SimpleCard(
            title: area.strArea,
            onTap: () {
              final route = MaterialPageRoute(
                builder: (context) => MealAreaPage(name: area.strArea),
              );
              Navigator.push(context, route);
            },
          );
        },
      ),
    );
  }

  Future<void> fetchArea() async {
    final result = await ListApi.getArea();
    setState(() {
      areas = result;
    });
  }
}
