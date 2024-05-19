import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/model/card.dart';
import 'package:quizlet_flashcard/views/home/home.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class CoursePage extends StatefulWidget {
  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  List<String> courses = ["Testing course 1", "Testing course 2", "Testing course 3", "Testing course 4", "Testing course 5", "Testing course 6"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: authThemeColor,
      body: Column(
        children: <Widget>[
          seachIcon(context, "Search courses"),
          Expanded(
            child: ListView.builder(
              itemCount: courses.length,
              itemBuilder: (ct, idx) => courseWidget(
                context,
                course: courses[idx],
                folder: false,
                options: false,
              ),
            ),
          ),
        ]
      ),
    );
  }
}
