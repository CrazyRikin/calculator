import 'package:calculator/utils/history_list.dart';
import 'package:flutter/material.dart';

class History extends StatefulWidget {
  const History({required this.onTap, super.key});
  final void Function(int index) onTap;

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
          const SizedBox(height: 50),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("No records found!",
                  style: TextStyle(
                      fontSize: 20, color: Color.fromARGB(175, 255, 255, 255))),
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
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  setState(() {
                    widget.onTap(index);
                    Navigator.pop(context);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: Card(
                      color: const Color.fromARGB(138, 75, 75, 75),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text(
                              historyList[index],
                              style: const TextStyle(fontSize: 24),
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    historyList.removeAt(index);
                                  });
                                },
                                icon: const Icon(Icons.cancel, size: 24))
                          ],
                        ),
                      )),
                ),
              ),
            ))
          ],
        );
      });
    }
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Container(
          color: const Color.fromARGB(255, 0, 0, 0),
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery.of(context).size.width * 0.9,
          child: content),
    );
  }
}
