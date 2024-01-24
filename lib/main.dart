import 'package:calculator/pages/home_page.dart';
import 'package:calculator/utils/theme_data.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      theme: kColorTheme,
      home: const Scaffold(
        body: HomePage(),
      ),
    ),
  );
}
