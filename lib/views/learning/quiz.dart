import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/model/quiz.dart';
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
  List<String> answers = [];
  int _selectedAnswerIndex = -1;
  bool _answerSelected = false; 
  bool _isCorrectAnswer = false;
  bool _showNextButton = false;
  int _correctAnswerCount = 0;

  @override
  void initState() {
    super.initState();
    _initAnswers();
  }

  void _initAnswers() {
    if (widget.quizz.isNotEmpty) {
      answers = List.from(widget.quizz[_currIdx].incorrect_answer);
      if (answers.length < widget.quizz[_currIdx].incorrect_answer.length + 1) {
        answers.add(widget.quizz[_currIdx].correct_answer);
        answers.shuffle();
      }
    }
  }

  Widget _answerToItem(String answer, bool correct, bool selected) {
    Color borderColor = selected ? (correct ? Colors.green : Colors.red) : Colors.white;
    IconData? icon = selected ? (correct ? Icons.check : Icons.close) : null;
    Color iconColor = selected ? (correct ? Colors.green : Colors.red) : Colors.transparent;

    bool showCorrectAnswer = _answerSelected && correct;

    return GestureDetector(
      onTap: () {
        if (!_answerSelected) {
          setState(() {
            _selectedAnswerIndex = answers.indexOf(answer);
            _isCorrectAnswer = correct;
            _answerSelected = true;
            _showNextButton = true;
            if (correct) {
              _correctAnswerCount++;
            }
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: borderColor, width: 3.0),
            borderRadius: BorderRadius.circular(10),
          ),
          child: ListTile(
            leading: icon != null ? Icon(icon, color: iconColor, size: 48) : SizedBox.shrink(),
            title: Text(
              showCorrectAnswer ? widget.quizz[_currIdx].correct_answer : answer,
              style: TextStyle(
                fontSize: 26,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showCompletionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You have answered $_correctAnswerCount out of ${widget.quizz.length} questions correctly.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

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
      body: Container(
        padding: EdgeInsets.only(top:70, left: 24, right: 24),
        child: Column(
          children: [
            Text(
              widget.quizz[_currIdx].question,
              style: TextStyle(
                fontSize: 30,
                color: Colors.white
              ),  
            ),
            SizedBox(height: 30,),
            ...answers.asMap().entries.map((entry) => _answerToItem(entry.value, entry.value == widget.quizz[_currIdx].correct_answer, entry.key == _selectedAnswerIndex)),
            SizedBox(height: 20,),
            if (_answerSelected && !_isCorrectAnswer)
              Text(
                'Incorrect! The correct answer is: ${widget.quizz[_currIdx].correct_answer}',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
            SizedBox(height: 10,),
            Text(
              'Correct Answers: $_correctAnswerCount',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: _answerSelected ? TextButton(
                onPressed: (){
                  setState(() {
                    if (_currIdx < widget.quizz.length - 1) {
                      _currIdx += 1;
                      _resetQuiz();
                    } else {
                      _showCompletionDialog(context); // Hiển thị popup khi hoàn thành
                    }
                  });
                }, 
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _currIdx < widget.quizz.length - 1 ? "Next" : "Done",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                )
              ) : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }

  void _shuffleSetAnswer() {
    setState(() {
      answers = List.from(widget.quizz[_currIdx].incorrect_answer);
      if (answers.length < widget.quizz[_currIdx].incorrect_answer.length + 1) {
        answers.add(widget.quizz[_currIdx].correct_answer);
        answers.shuffle();
      }
    });
  }

  void _resetQuiz() {
    _answerSelected = false;
    _isCorrectAnswer = false;
    _showNextButton = false;
    _selectedAnswerIndex = -1;
    _shuffleSetAnswer();
  }
}
