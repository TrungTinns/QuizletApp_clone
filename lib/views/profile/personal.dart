import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizlet_flashcard/views/settings/settings.dart';
import 'package:quizlet_flashcard/components/calendar.dart';
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
      body: SingleChildScrollView(
        child: Center(
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
              customButton(
                context,
                navigateTo: MySettings(), 
                text: 'Your Settings',
                icon: Icons.settings_suggest_outlined,
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
      ),
    );
  }
}