import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/components/flashcard.dart';
import 'package:quizlet_flashcard/model/quiz/quiz.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class FlashCardScreen extends StatefulWidget {
  List<Quiz> quizz;
  FlashCardScreen({super.key, required this.quizz});

  @override
  State<FlashCardScreen> createState() => _FlashCardScreenState();
}

class _FlashCardScreenState extends State<FlashCardScreen> {
  int total = 0;
  int curr = 0;

  @override
  void initState() {
    // TODO: implement initState
    total = widget.quizz.length;
    super.initState();
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
      body: Center(
        child: CarouselSlider(
          items: widget.quizz.map((e) => FlashcardWidget(context, frontContent: e.question, backContent: e.correct_answer)).toList(),
          options: CarouselOptions(
            height: 600.0,
            enlargeCenterPage: true,
            enableInfiniteScroll: false,
            initialPage: 0,
            autoPlay: false,
          ),
        ),
      ),
    );
  }
}