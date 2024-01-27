import 'package:calculator/pages/home_page.dart';
import 'package:calculator/utils/theme_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      theme: kColorTheme,
      home: const Scaffold(
        body: HomePage(),
      ),
    ),
  );
}
