import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizlet_flashcard/model/card.dart';
import 'package:quizlet_flashcard/views/create.dart';
import 'package:quizlet_flashcard/views/home.dart';
import 'package:quizlet_flashcard/views/settings.dart';
import 'package:quizlet_flashcard/widgets/calendar.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: authThemeColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30),
            CircleAvatar(
              radius: 50, 
              backgroundImage: AssetImage('C:\Users\User\OneDrive\Pictures'),
            ),
            SizedBox(height: 10), 
            Text(
              'Username',
              style: TextStyle(
              fontSize: 16,
              color: textColor,),
            ),
            SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder: (context) => MySettings()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9, 
                height: MediaQuery.of(context).size.height * 0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey), 
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      iconSize: 40,
                      icon: Icon(Icons.settings_suggest_outlined),
                      color: textColor,
                      onPressed: () {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => MySettings()));
                      },
                    ),
                    Text(
                      'Your Settings',
                      style: TextStyle(
                        fontSize: 20,
                        color: textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
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
    );
  }
}