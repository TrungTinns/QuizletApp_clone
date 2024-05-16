import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/model/card.dart';
import 'package:quizlet_flashcard/views/home.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class ExplanationPage extends StatefulWidget {
  @override
  _ExplanationPageState createState() => _ExplanationPageState();
}

class _ExplanationPageState extends State<ExplanationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: authThemeColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Expert Explanations',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ItemCard(color: Colors.red, text: 'Item 1', width: 100.0, height: 150.0,),
                    ItemCard(color: Colors.blue, text: 'Item 2', width: 100.0, height: 150.0,),
                    ItemCard(color: Colors.green, text: 'Item 3', width: 100.0, height: 150.0,),
                    ItemCard(color: Colors.yellow, text: 'Item 4', width: 100.0, height: 150.0,),
                    ItemCard(color: Colors.orange, text: 'Item 5', width: 100.0, height: 150.0,),
                  ],
                ),
              ),
          seachIcon(context, "Search textbooks, ISBNs, questions") 
        ],
      ),
    );
  }
}