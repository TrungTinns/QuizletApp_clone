import 'package:flutter/material.dart';
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
      backgroundColor: authThemeColor,
    );
  }
}