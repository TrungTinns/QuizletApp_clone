import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/components/calendar.dart';
import 'package:quizlet_flashcard/model/card.dart';
import 'package:quizlet_flashcard/views/create_class.dart';
import 'package:quizlet_flashcard/views/create_course.dart';
import 'package:quizlet_flashcard/views/create_folder.dart';
import 'package:quizlet_flashcard/views/explaination/explanation.dart';
import 'package:quizlet_flashcard/views/profile/personal.dart';
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
    Text('Create new', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    Text('Your Library', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
    ),
    PersonalPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    }
  );

  if (index == 2) {
    showModalBottomSheet( context: context,
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: authThemeColor,
              ),
            child: Text(
              'Menu',
                style: TextStyle(
                  color: textColor,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text('Explanation'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(1); 
              }
            ),
            ListTile(
              title: Text('Create'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(2); 
              }
            ),
            ListTile(
              title: Text('Library'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(3); 
              }
            ),
            ListTile(
              title: Text('Personal Page'),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(4); 
              }
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        seachIcon(context, "Search..."), 
        Expanded(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Recently',
                    style: TextStyle(
                      fontSize: 20,
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                height: 100.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    ItemCard(color: Colors.red, text: 'Item 1', width: 120.0, height: 50.0,),
                    ItemCard(color: Colors.blue, text: 'Item 2', width: 120.0, height: 50.0,),
                    ItemCard(color: Colors.green, text: 'Item 3', width: 120.0, height: 50.0,),
                    ItemCard(color: Colors.yellow, text: 'Item 4', width: 120.0, height: 50.0,),
                    ItemCard(color: Colors.orange, text: 'Item 5', width: 120.0, height: 50.0,),
                  ],
                ),
              ),
              SizedBox(height: 16.0), 
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
            ],
          ),
        ),
        
      ],
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
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateCourse()));
            },
          ),
          ListTile(
            title: Text(
              'Folder',
              style: TextStyle(color: textColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateFolder()));
            },
          ),
          ListTile(
            title: Text(
              'Class',
              style: TextStyle(color: textColor),
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CreateClass()));
            },
          ),
        ],
      ),
    );
  }
}