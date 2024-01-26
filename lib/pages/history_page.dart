import 'package:calculator/utils/history_list.dart';
import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.5,
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) => Text(historyList[index]),
            ))
          ],
        ),
      ),
    );
  }
}
