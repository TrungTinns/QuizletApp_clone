import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/views/detailedfolder/detailfolder.dart';
import 'package:quizlet_flashcard/views/manage/classcourse.dart';
import 'package:quizlet_flashcard/views/manage/complete.dart';
import 'package:quizlet_flashcard/views/manage/created.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';

class ManageCourse extends StatefulWidget {
  @override
  _ManageCourseState createState() => _ManageCourseState();
}

class _ManageCourseState extends State<ManageCourse> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Add courses',
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: IconButton(
                icon: Icon(Icons.done),
                color: textColor,
                iconSize: 30,
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DetailFolder(course: '',)));
                },
              ),
            ),
          ],
          bottom: TabBar(
            indicatorColor: textColor,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey,
            onTap: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
            tabs: [
              Tab(text: "Created"),
              Tab(text: "Complete"),
              Tab(text: "Class"),
            ],
          )
        ),
        backgroundColor: authThemeColor,
        body: TabBarView(
          children: [
            CreatedCourse(),
            CompleteCourse(),
            ClassCourse(),
          ],
        ),
      ),
    );
  }
}

