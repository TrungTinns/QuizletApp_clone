import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/model/card.dart';
import 'package:quizlet_flashcard/views/create/create_course.dart';
import 'package:quizlet_flashcard/views/home/home.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class CreatedCourse extends StatefulWidget {
  @override
  _CreatedCourseState createState() => _CreatedCourseState();
}

class _CreatedCourseState extends State<CreatedCourse> {
  List<String> courses = ["Testing course 1", "Testing course 2", "Testing course 3", "Testing course 4", "Testing course 5", "Testing course 6"];
  
  Widget button(BuildContext context,{required String label}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateCourse()));
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 2),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 300,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: authThemeColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: 20), 
          button(context, label: "+ Create new course"),
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
