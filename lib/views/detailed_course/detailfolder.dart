import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/model/card.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class DetailFolder extends StatelessWidget {
  final String course;

  DetailFolder({required this.course});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle the add action
            },
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              // Handle the remove action
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              course,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 8.0),
          BlueButton(), // Custom button
          SizedBox(height: 16.0),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Example number of courses
              itemBuilder: (context, index) {
                return courseWidget(
                  context,
                  course: "Sub course ${index + 1}",
                  folder: index % 2 == 0, // Just an example to alternate folder status
                  options: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          'Button',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
