import 'package:flutter/material.dart';

import 'package:test_project_for_internship/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Raleway',
      ),
      home: HomePage(),
    );
  }
}
