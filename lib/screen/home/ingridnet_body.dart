import 'package:flutter/material.dart';
import 'package:themealdb_app/model/ingrient_modal.dart';
import 'package:themealdb_app/screen/home/widget/ingrident_card.dart';

import 'package:themealdb_app/services/list_api.dart';

class IngridentBody extends StatefulWidget {
  const IngridentBody({super.key});

  @override
  State<IngridentBody> createState() => _IngridentBodyState();
}

class _IngridentBodyState extends State<IngridentBody> {
  List<IngrientModal> ingridents = [];

  @override
  void initState() {
    super.initState();
    fetchIngridentDetail();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingridents.length,
      itemBuilder: (context, index) {
        final item = ingridents[index];
        return IngridentCard(
          ingridents: item,
        );
      },
    );
  }

  Future<void> fetchIngridentDetail() async {
    final result = await ListApi.getAllIngridents();
    setState(() {
      ingridents = result;
    });
  }
}
