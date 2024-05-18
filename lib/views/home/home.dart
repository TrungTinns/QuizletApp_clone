import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizlet_flashcard/model/card.dart';
import 'package:quizlet_flashcard/components/create.dart';
import 'package:quizlet_flashcard/views/detailed_course/detailed_course.dart';
import 'package:quizlet_flashcard/views/explaination/explanation.dart';
import 'package:quizlet_flashcard/views/profile/personal.dart';
import 'package:quizlet_flashcard/components/calendar.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ExplanationPage(),
    Text(
      'Create new',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text(
      'Your Library',
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    PersonalPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 2) {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return BottomSheetWidget();
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      resizeToAvoidBottomInset: false,
      backgroundColor: authThemeColor,
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home Page',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Explanation',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Create',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.archive_outlined),
            label: 'Library',
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Personal',
            backgroundColor: Colors.transparent,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> courses = ["Testing course 1", "Testing course 2", "Testing course 3", "Testing course 4", "Testing course 5", "Testing course 6"];

  Widget _coursesToWidget(String course, bool folder, bool options) {
    int vocabulary = 70;
    
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        child: Container(
          height: 180,
          width: 400,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              folder?
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
                child: Icon(
                  Icons.folder
                )
              ) :
              Container(),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16, top: 8),
                child: Text(
                  course,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              
              SizedBox(height: 8.0),
              !folder?
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Text(
                  vocabulary.toString() + " terms",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey[600],
                  ),
                ),
              ) :
              Container(),
              SizedBox(height: 16.0),
              ListTile(
                leading: CircleAvatar(
                  radius: 16,
                ),
                title: Text(
                  "User",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                trailing: options ?  IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)) : null,
              ),
            ],
          ),
        ),
        onTap: () {
        if (!folder) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DetailedCourses(course: course))
          );
        }
      },
      ),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          seachIcon(context, "Search..."),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Achievement',
                style: TextStyle(
                  fontSize: 20,
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          CalendarFrame(),
          // Courses
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Text(
                  'Courses',
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: TextButton(
                  onPressed: (){},
                  child: Text(
                    "View all",
                    style: TextStyle(
                      color: Colors.blue
                    ),
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: courses.length,
              itemBuilder: (ct, idx) => _coursesToWidget(courses[idx], false, false),
            ),
          ),
          SizedBox(height: 16.0),
          
          // Recommendations
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Text(
                  'Recommendations',
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: courses.length,
              itemBuilder: (ct, idx) => _coursesToWidget(courses[idx], false, true),
            ),
          ),
          SizedBox(height: 16.0),
          
          // Folders
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: ListTile(
                title: Text(
                  'Folders',
                  style: TextStyle(
                    fontSize: 20,
                    color: textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              trailing: TextButton(
                onPressed: (){},
                child: Text(
                  "View all",
                  style: TextStyle(
                    color: Colors.blue
                  ),
                ),
              ),
              ),
            ),
          ),
          Container(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: courses.length,
              itemBuilder: (ct, idx) => _coursesToWidget(courses[idx], true, true),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class BottomSheetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: snackBarColor,
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Course',
              style: TextStyle(color: textColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateQuiz()));
            },
          ),
          ListTile(
            title: Text(
              'Folder',
              style: TextStyle(color: textColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateQuiz()));
            },
          ),
          ListTile(
            title: Text(
              'Class',
              style: TextStyle(color: textColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateQuiz()));
            },
          ),
        ],
      ),
    );
  }
}
