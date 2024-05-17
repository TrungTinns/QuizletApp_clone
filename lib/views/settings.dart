import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/views/home.dart';
import 'package:quizlet_flashcard/views/signin.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import '../widgets/widget.dart';


class MySettings extends StatefulWidget {
  @override
  _MySettingsState createState() => _MySettingsState();
}

class _MySettingsState extends State<MySettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),   
      resizeToAvoidBottomInset: false,
      backgroundColor: authThemeColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Text(
                    'Personal Information',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  settingButton(context, navigateTo: HomePage(), text: "User Name"),
                  settingButton(context, navigateTo: HomePage(), text: "Email"),
                  settingButton(context, navigateTo: HomePage(), text: "Create password"),
                ],
              )
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Text(
                    'Study abroad',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  settingButton(context, navigateTo: HomePage(), text: "Save learning to study offline"),
                  settingButton(context, navigateTo: HomePage(), text: "Manage storage capacity"),
                ],
              )
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Text(
                    'Priority',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  settingButton(context, navigateTo: HomePage(), text: "Annoucement"),
                  settingButton(context, navigateTo: HomePage(), text: "Sound effect"),
                ],
              )
            ),
          SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                children: [
                  Text(
                    'Introduction',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                ],
              ),
            ),
            Center(
              child: Column(
                children: [
                  settingButton(context, navigateTo: HomePage(), text: "Privacy"),
                  settingButton(context, navigateTo: HomePage(), text: "Terms of service"),
                  settingButton(context, navigateTo: HomePage(), text: "Open source license"),
                  settingButton(context, navigateTo: HomePage(), text: "Support center"),
                  SizedBox(height: 20,),
                  blueButton(context, label: "Log out", navigateTo: SignIn()),
                ],
              )
            ),
            
          ],
        ),
      ),
    );
  }
}