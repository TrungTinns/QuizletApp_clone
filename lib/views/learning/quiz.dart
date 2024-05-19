import 'dart:math';

import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/model/quiz/quiz.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class QuizScreen extends StatefulWidget {
  List<Quiz> quizz;
  
  QuizScreen({super.key, required this.quizz});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currIdx = 0;

  Widget _answerToItem(String answers, bool correct) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: correct? Colors.green : Colors.red, width: 3.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Icon(Icons.close, color: correct? Colors.green : Colors.red, size: 48),
          title: Text(
            answers,
            style: TextStyle(
              fontSize: 26,
            ),  
          ),
        ),
      ),
    );
  }
  
  void _shuffleSetAnswer() {}

  @override
  Widget build(BuildContext context) {
    List<String> answers = widget.quizz[_currIdx].incorrect_answer;
    if (answers.length < (widget.quizz[_currIdx].incorrect_answer.length + 1)) {
      answers.add(widget.quizz[_currIdx].correct_answer);
    }
    answers.shuffle();

    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: authThemeColor,
      body: Container(
        padding: EdgeInsets.only(top:70, left: 24, right: 24),
        child: Column(
          children: [
            Text(
              widget.quizz[_currIdx].question,
              style: TextStyle(
                fontSize: 30,
              ),  
            ),
            SizedBox(height: 30,),
            ...answers.map((e) => _answerToItem(e, e == widget.quizz[_currIdx].correct_answer)),
          ],
        ),
      ),
    );
  }
}