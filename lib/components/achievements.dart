import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/components/calendar.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:table_calendar/table_calendar.dart';
import '../widgets/widget.dart';


class Achievement extends StatefulWidget {
  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      backgroundColor: authThemeColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Text(
              'Your Achievement',
              style: TextStyle(
                fontSize: 20,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30,),
            Calendar(calendarFormat: CalendarFormat.month),
          ],
        ),
      ),
    );
  }
}
