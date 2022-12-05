import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:map_1/home_p.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScren(),
    );
  }
}
