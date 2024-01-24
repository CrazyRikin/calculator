import 'package:calculator/utils/button_texts.dart';
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
          decoration: const BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
        ),
        Container(
            padding: const EdgeInsets.all(16),
            height: screenHeight * 0.66,
            decoration: const BoxDecoration(
                border: Border(
                    top: BorderSide(color: Color.fromARGB(255, 122, 121, 121))),
                color: Color.fromARGB(255, 5, 5, 5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: GridView.builder(
                    itemCount: 16,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4),
                    itemBuilder: (ctx, index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextButton(
                          onPressed: () {}, child: Text(buttonLabels[index])),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width,
                  child: TextButton(
                    style: const ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(500)))),
                    ),
                    onPressed: () {},
                    child: const Text("="),
                  ),
                )
              ],
            ))
      ],
    ));
  }
}
