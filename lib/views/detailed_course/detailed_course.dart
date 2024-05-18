import 'package:card_slider/card_slider.dart';
import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class DetailedCourses extends StatefulWidget {
  String course;
  DetailedCourses({super.key, required this.course});

  @override
  State<DetailedCourses> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DetailedCourses> {
  
  List<Widget> _itemsToWidget() {
    return [Container()];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black87),
        centerTitle: true,
        elevation: 0.0,
        actions: [

        ],
      ),
      backgroundColor: authThemeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
           
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  title: Text(
                    widget.course,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.download),
                    onPressed: () {},
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 12,
                  ),
                  title: Row(
                    children: <Widget> [
                      Text(
                        "User",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        height: 12,
                        width: 0.5,
                        color: Colors.grey,
                        margin: EdgeInsets.symmetric(horizontal: 8),
                      ),
                      Text(
                        "70 Term",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              children: <Widget>[
                Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.note, color: Colors.purpleAccent,),
                    title: Text(
                      "Flash Card",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.question_mark, color: Colors.purpleAccent,),
                    title: Text(
                      "Learning",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.sticky_note_2_rounded, color: Colors.purpleAccent,),
                    title: Text(
                      "Testing",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
                Card(
                  elevation: 4.0,
                  margin: EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: Icon(Icons.quiz, color: Colors.purpleAccent,),
                    title: Text(
                      "Pair Card Games",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onTap: (){},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class DetailedCourseScreen extends StatefulWidget {
  @override
  State<DetailedCourseScreen> createState() => _DetailedCourseScreenScreenState();
}

class _DetailedCourseScreenScreenState extends State<DetailedCourseScreen> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                  "",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ),
          ),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}