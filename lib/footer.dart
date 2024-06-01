import 'package:flutter/material.dart';
import 'choice_item.dart';

class Footer extends StatelessWidget {
  final Function(String) onChoiceSelected;
  final List<String> selectedChoices;
  final List<String> choices;

  Footer({required this.onChoiceSelected, required this.selectedChoices, required this.choices});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Wrap(
          children: choices
              .map((choice) => ChoiceItem(
            choice: choice,
            isSelected: selectedChoices.contains(choice),
            onSelected: onChoiceSelected,
          ))
              .toList(),
        ),
      ),
    );
  }
}
