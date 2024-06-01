import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'header.dart';
import 'footer.dart';
import 'tag_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> selectedChoices = [];
  List<String> choices = [];
  bool isLoading = true;
  Color themeColor = Colors.purple;

  @override
  void initState() {
    super.initState();
    fetchChoices();
  }

  Future<void> fetchChoices() async {
    final response = await http.get(Uri.parse(
        'https://dummyjson.com/todos'));
    if (response.statusCode == 200) {
      List<dynamic> todos = json.decode(response.body)['todos'];
      setState(() {
        choices = todos.map((todo) => todo['todo'].toString()).toList();
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load todos');
    }
  }

  void toggleChoice(String choice) {
    setState(() {
      if (selectedChoices.contains(choice)) {
        selectedChoices.remove(choice);
      } else {
        selectedChoices.add(choice);
      }
    });
  }

  void changeThemeColor(Color color) {
    setState(() {
      themeColor = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your choice',
            style: TextStyle(
              color: Colors.white,
            )),
        backgroundColor: themeColor,
        actions: [
          IconButton(
            icon: const Icon(
                Icons.color_lens,
                color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: const Text('Select a color :'),
                  content: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ColorOption(
                          color: Colors.purple,
                          onSelect: changeThemeColor,
                        ),
                        ColorOption(
                          color: Colors.blue,
                          onSelect: changeThemeColor,
                        ),
                        ColorOption(
                          color: Colors.green,
                          onSelect: changeThemeColor,
                        ),
                        ColorOption(
                          color: Colors.red,
                          onSelect: changeThemeColor,
                        ),
                        ColorOption(
                          color: Colors.orange,
                          onSelect: changeThemeColor,
                        ),
                        ColorOption(
                          color: Colors.black45,
                          onSelect: changeThemeColor,
                        ),
                        ColorOption(
                          color: Colors.pink,
                          onSelect: changeThemeColor,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: <Widget>[
                Header(
                    selectedChoices: selectedChoices, themeColor: themeColor),
                Expanded(
                  child: Footer(
                    onChoiceSelected: toggleChoice,
                    selectedChoices: selectedChoices,
                    choices: choices,
                  ),
                ),
              ],
            ),
    );
  }
}

class ColorOption extends StatelessWidget {
  final Color color;
  final Function(Color) onSelect;

  ColorOption({required this.color, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(color),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: color,
        ),
        margin: const EdgeInsets.all(4.0),
        width: 50,
        height: 50,
      ),
    );
  }
}
