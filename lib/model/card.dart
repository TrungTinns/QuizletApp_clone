import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';

class ItemCard extends StatelessWidget {
  final Color color;
  final String text;
  final double width, height;

  const ItemCard({required this.color, required this.text, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}