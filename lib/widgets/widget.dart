import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/views/detailed_course/detailed_course.dart';
import 'package:quizlet_flashcard/views/settings/settings.dart';
import 'package:quizlet_flashcard/views/login/signin.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';

Widget appBar(BuildContext context) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: const <TextSpan>[
        TextSpan(text: 'Quizlet', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500, color: Colors.white70), ),
        TextSpan(text: 'App', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue)),
      ],
    ),
  );
}

Widget blueButton(BuildContext context,{required String label, required Widget navigateTo}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navigateTo),
      );
    },
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 18),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width - 48,
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    ),
  );
}

Widget seachIcon(BuildContext context, String hintText){
  return Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
              ),
            ),
          ),
    );
}

AppBar customAppBar(BuildContext context) {
  return AppBar(
    title: appBar(context),
    backgroundColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black87),
    centerTitle: true,
    elevation: 0.0,
  );
}

Widget customButton(BuildContext context, {IconData? icon, required Widget navigateTo, required String text}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navigateTo),
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
          Icon(
            icon,
            size: 40,
            color: textColor,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget settingButton(BuildContext context, {IconData? icon, required Widget navigateTo, required String text}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => navigateTo),
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
          Icon(
            icon,
            size: 10,
            color: textColor,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
              color: textColor,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget courseWidget(BuildContext context, {required String course, bool folder = false, bool options = false}) {
  int term = 70;
    
    return InkWell(
      child: Card(
        elevation: 4.0,
        margin: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 150,
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
                  term.toString() + " terms",
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
              ),
            ],
          ),
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
    );
  }      
