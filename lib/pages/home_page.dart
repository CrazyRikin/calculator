import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
        child: Column(
      children: [
        Container(
          height: screenHeight * 0.34,
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 255, 68, 0)),
        ),
        Container(
          height: screenHeight * 0.66,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
        )
      ],
    ));
  }
}
