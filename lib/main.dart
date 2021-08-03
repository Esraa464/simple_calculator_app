import 'package:flutter/material.dart';
import 'package:simple_calculator_app/screens/hom_page_screen/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'calculator app',
      // theme: ThemeData(primarySwatch: Colors.deepPurpleAccent[100]),
      home: HomePage(),
    );
  }
}
