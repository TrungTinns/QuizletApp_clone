import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/model/card.dart';
import 'package:quizlet_flashcard/views/manage/manage.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class DetailFolder extends StatelessWidget {
  final String course;

  DetailFolder({required this.course});

  Widget studyButton(BuildContext context, {required String label}) {
  return Container(
    width: double.infinity,
    padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Center(
      child: GestureDetector(
        onTap: () {
          openBottomSheet(context); 
        },
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
  );
}
void openBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        child: Wrap(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.note, color: Colors.purpleAccent,),
              title: Text('Flashcard'),
              onTap: () {
                // Handle option 1
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.question_mark, color: Colors.purpleAccent,),
              title: Text('Quiz'),
              onTap: () {
                // Handle option 2
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.sticky_note_2_rounded, color: Colors.purpleAccent,),
              title: Text('Typing'),
              onTap: () {
                // Handle option 3
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
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
        
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            
            onPressed: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ManageCourse()));
            },
          ),
          // selectedItemColor: Colors.white,
          IconButton(
            icon: Icon(Icons.more_horiz_outlined),
            onPressed: () {
              // Handle the remove action
            },
          ),
          // selectedItemColor: Colors.white,
        ],
        
      ),
      backgroundColor: authThemeColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ListTile(
                    title: Text(
                      course,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
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
            studyButton(context, label: "Study now"),
            SizedBox(height: 16.0),
            // Expanded(
            //     child: ListView.builder(
            //       itemCount: courses.length,
            //       itemBuilder: (ct, idx) => courseWidget(
            //           context,
            //           course: courses[idx],
            //           folder: true,
            //           options: true,
            //         ),
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }
}

