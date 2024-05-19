import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/components/flashcard.dart';
import 'package:quizlet_flashcard/model/quiz/quiz.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class TypingScreen extends StatefulWidget {
  List<Quiz> quizz;
  TypingScreen({super.key, required this.quizz});

  @override
  State<TypingScreen> createState() => _TypingScreenState();
}

class _TypingScreenState extends State<TypingScreen> {
  int _currIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        elevation: 0.0,
      ),
      backgroundColor: authThemeColor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top:80, left: 12, right: 12),
          child: Column(
            children: [
              Card(
                child: Center(
                  child: Text(widget.quizz[_currIdx].question),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}