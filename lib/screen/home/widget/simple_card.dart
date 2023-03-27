import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    super.key,
    required this.title,
    required this.onTap,
  });
  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 30),
          ),
        ),
      ),
    );
  }
}
