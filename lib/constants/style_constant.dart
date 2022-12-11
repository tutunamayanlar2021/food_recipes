import 'dart:io';

import 'package:flutter/material.dart';

class StyleConstants {
  static StyleConstants instance = StyleConstants._init();
  StyleConstants._init();
  final lTitle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey);
  final mTitle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange);
  final xTitle = const TextStyle(fontSize: 20, color: Colors.white);
  final sTitle = TextStyle(
    fontSize: 16,
    color: Colors.black,
  );
  final sTitle2 =
      TextStyle(fontSize: 25, color: Colors.black, fontFamily: "Cookie");
  final urunTitle = TextStyle(fontSize: 14, color: Colors.grey[600]);
  final subTitle = const TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.orange,
      fontFamily: "Cookie");
  final desTitle = TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.bold,
      color: Colors.black.withOpacity(0.6),
      fontFamily: "Cookie");
  final des2Title = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[600]);
}
