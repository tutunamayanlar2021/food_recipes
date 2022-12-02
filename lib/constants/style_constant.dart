import 'package:flutter/material.dart';

class StyleConstants {
  static StyleConstants instance = StyleConstants._init();
  StyleConstants._init();
  final lTitle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey);
  final mTitle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.orange);
  final xTitle = const TextStyle(fontSize: 20, color: Colors.white);
  final sTitle = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey);
  final urunTitle = TextStyle(fontSize: 14, color: Colors.grey[600]);
  final fiyatTitle = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.orange);
  final desTitle = const TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black);
  final des2Title = TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey[600]);
}
