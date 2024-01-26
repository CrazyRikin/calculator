import 'package:calculator/utils/buttons/text_button.dart';
import 'package:calculator/utils/buttons/text_button_labels.dart';
import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var displayText = '';

  void onPressing(String label) {
    if (label == 'C') {
      setState(() {
        displayText = '';
      });
      return;
    } else if (label == 'H') {
      return;
    } else if (label == 'e') {
      return;
    } else if (label == 'X') {
      setState(() {
        displayText = displayText + ('*');
      });

      return;
    } else if (label == '=') {
      setState(() {
        displayText = displayText.interpret().toString();
      });
    } else {
      setState(() {
        displayText = displayText + label;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: (screenHeight * 0.25) -
                  1, //-1 for divider if not -1 then screen overflow
              color: Colors.black,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        displayText,
                        style: const TextStyle(fontSize: 36),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(
                height: 1,
                thickness: 1.5,
                color: Color.fromARGB(255, 44, 44, 44)),
            Container(
              padding: const EdgeInsets.all(8),
              color: Colors.black,
              height: screenHeight * 0.75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 24),
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            displayText = displayText.substring(
                                0, displayText.length - 1);
                          });
                        },
                        icon: const Icon(Icons.backspace)),
                  ),
                  Expanded(
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: buttonLabels.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4),
                      itemBuilder: (context, index) => CustomTextButton(
                          label: buttonLabels[index],
                          onpressed: () {
                            onPressing(buttonLabels[index]);
                          }),
                    ),
                  ),
                ],
              ),
            )
          ]),
    );
  }
}
