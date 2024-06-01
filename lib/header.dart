import 'package:flutter/material.dart';
import 'tag_detail_page.dart';

class Header extends StatelessWidget {
  final List<String> selectedChoices;
  final Color themeColor;

  Header({required this.selectedChoices, required this.themeColor});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double headerHeight = screenHeight / 2;

    return Container(
      width: double.infinity,
      height: headerHeight,
      padding: const EdgeInsets.all(10.0),
      color: themeColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 10.0),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                children: selectedChoices
                    .map((choice) => Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      TagDetailPage(tag: choice),
                                ),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Text(choice),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
