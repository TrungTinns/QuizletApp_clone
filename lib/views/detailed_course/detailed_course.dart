import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';

class DetailedCourses extends StatefulWidget {
  String course;
  DetailedCourses({super.key, required this.course});

  @override
  State<DetailedCourses> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DetailedCourses> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
      ),
      backgroundColor: authThemeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                    widget.course,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class DetailedCourseScreen extends StatefulWidget {
  @override
  State<DetailedCourseScreen> createState() => _DetailedCourseScreenScreenState();
}

class _DetailedCourseScreenScreenState extends State<DetailedCourseScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}