import 'package:flutter/material.dart';
import 'package:food_recipes/view/food_api/food_api_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants/style_constant.dart';
import 'view/Home/home_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Home(),
    );
  }
}
