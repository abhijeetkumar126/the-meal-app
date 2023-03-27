import 'package:flutter/material.dart';
import 'package:themealdb_app/screen/home/area_page.dart';
import 'package:themealdb_app/screen/home/category_body.dart';
import 'package:themealdb_app/screen/home/ingridnet_body.dart';
import 'package:themealdb_app/screen/home/setting_body.dart';
import 'package:themealdb_app/screen/search/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ingrdrients"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: IconButton(
              onPressed: () {
                final route = MaterialPageRoute(
                  builder: (context) => SearchPage(),
                );
                Navigator.push(context, route);
              },
              icon: Icon(Icons.search),
            ),
          )
        ],
      ),
      body: IndexedStack(
        index: activeIndex,
        children: [
          IngridentBody(),
          AreaBody(),
          CategoryBody(),
          SettingBody(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            activeIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Ingridient'),
          BottomNavigationBarItem(icon: Icon(Icons.area_chart), label: 'Area'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings')
        ],
        currentIndex: activeIndex,
      ),
    );
  }
}
