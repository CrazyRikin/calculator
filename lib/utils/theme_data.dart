import 'package:flutter/material.dart';

var kColorTheme = ThemeData(
  useMaterial3: true,
  textButtonTheme: const TextButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(CircleBorder(eccentricity: 0)),
          padding: MaterialStatePropertyAll(EdgeInsets.all(8)),
          foregroundColor:
              MaterialStatePropertyAll(Color.fromARGB(202, 255, 255, 255)),
          backgroundColor:
              MaterialStatePropertyAll(Color.fromARGB(192, 75, 75, 75)))),
  colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark, seedColor: Colors.black),
);
