import 'package:flutter/material.dart';

class TagDetailPage extends StatelessWidget {
  final String tag;

  TagDetailPage({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tag Detail'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Text(
              'Details :',
              style: TextStyle(fontSize: 20.0),
            ),
            const SizedBox(height: 5.0),
            Text(
              style:
                  const TextStyle(fontStyle: FontStyle.italic, fontSize: 16.0),
              tag,
            ),
          ],
        ),
      ),
    );
  }
}
