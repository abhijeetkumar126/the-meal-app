import 'package:flutter/material.dart';
import 'package:themealdb_app/model/ingrient_modal.dart';
import 'package:themealdb_app/screen/meal/meal_ingrdient_page.dart';

class IngridentCard extends StatelessWidget {
  const IngridentCard({
    super.key,
    required this.ingridents,
  });
  final IngrientModal ingridents;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
      child: Card(
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            final name = ingridents.strIngredient;
            if (name == null) {
              final snackBar = SnackBar(content: Text('No data'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              final route = MaterialPageRoute(
                builder: (context) => MealIngridentPage(name: name),
              );
              Navigator.push(context, route);
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ingridents.strIngredient ?? 'No Name',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(height: 20),
                Text(
                  ingridents.strDescription ?? 'No Description',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
