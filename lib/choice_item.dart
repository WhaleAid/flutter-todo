import 'package:flutter/material.dart';

class ChoiceItem extends StatelessWidget {
  final String choice;
  final bool isSelected;
  final Function(String) onSelected;

  ChoiceItem({required this.choice, required this.isSelected, required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GestureDetector(
        onTap: () => onSelected(choice),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          decoration: BoxDecoration(
            color: isSelected ? Colors.yellow : Colors.grey[300],
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Text(
            choice,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
