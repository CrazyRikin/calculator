import 'package:calculator/utils/history_list.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    Widget content = Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No records found!", style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
    if (historyList.isNotEmpty) {
      setState(() {
        content = Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.arrow_back)),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () => setState(() {
                    historyList = [];
                    Navigator.pop(context);
                  }),
                  child: const Card(
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(Icons.delete),
                            Text(
                              "Clear History",
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                      )),
                )
              ],
            ),
            Expanded(
                child: ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, index) => Card(
                  color: const Color.fromARGB(192, 75, 75, 75),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      historyList[index],
                      style: const TextStyle(fontSize: 24),
                    ),
                  )),
            ))
          ],
        );
      });
    }
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
          color: const Color.fromARGB(255, 10, 10, 10),
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          child: content),
    );
  }
}
