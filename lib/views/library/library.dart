import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/views/create/create_class.dart';
import 'package:quizlet_flashcard/views/create/create_course.dart';
import 'package:quizlet_flashcard/views/create/create_folder.dart';
import 'package:quizlet_flashcard/views/home/home.dart';
import 'package:quizlet_flashcard/views/library/classpage.dart';
import 'package:quizlet_flashcard/views/library/coursepage.dart';
import 'package:quizlet_flashcard/views/library/folderpage.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import '../../widgets/widget.dart';

class LibraryPage extends StatefulWidget {
  @override
  _LibraryPageState createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int _selectedIndex = 0;

  void _onAddButtonPressed() {
    switch (_selectedIndex) {
      case 0:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateCourse()));
        break;
      case 1:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateClass()));
        break;
      case 2:
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateFolder()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Library',
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
                icon: Icon(Icons.add),
                color: textColor,
                iconSize: 30,
                onPressed: _onAddButtonPressed,
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
              Tab(text: "Course"),
              Tab(text: "Class"),
              Tab(text: "Folder"),
            ],
          )
        ),
        backgroundColor: authThemeColor,
        body: TabBarView(
          children: [
            CoursePage(),
            ClassPage(),
            FolderPage(),
          ],
        ),
      ),
    );
  }
}

