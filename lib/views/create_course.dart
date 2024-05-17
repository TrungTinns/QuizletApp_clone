import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/views/home.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import '../widgets/widget.dart';

class CreateCourse extends StatefulWidget {
  @override
  _CreateCourseState createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  final _formKey = GlobalKey<FormState>();
  late String courseName, courseDescription, _term, _defi;
  List<String> termDefinition = []; 

  void addTermDefinition() {
    setState(() {
      termDefinition.add('');
    });
  }

  Widget buildTermDefinitionContainer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: TextFormField(
              validator: (val) => val!.isEmpty ? "Enter term" : null,
              style: const TextStyle(color: textColor),
              cursorColor: textColor,
              decoration: const InputDecoration(
                helperText: "Term",
                helperStyle: TextStyle(color: textColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                )
              ),
              onChanged: (val) {
                  _term = val;
              },
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              validator: (val) => val!.isEmpty ? "Enter definition" : null,
              style: const TextStyle(color: textColor),
              cursorColor: textColor,
              decoration: const InputDecoration(
                helperText: "Definition",
                helperStyle: TextStyle(color: textColor),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                )
              ),
              onChanged: (val) {
                  _defi = val;
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customAppBar(context),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: IconButton(
              icon: Icon(Icons.add),
              color: textColor,
              onPressed: addTermDefinition,
            ),
          ),
        ],
      ),
      backgroundColor: authThemeColor,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Center(
                child: Text(
                  'Create Course',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter course name" : null,
                style: const TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: const InputDecoration(
                  helperText: "Topic",
                  hintText: "Topic, chapter, unit",
                  hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                  helperStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  )
                ),
                onChanged: (val) {
                  courseName = val;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: const InputDecoration(
                  helperText: "Description",
                  hintText: "Describe your course",
                  hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                  helperStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  )
                ),
                onChanged: (val) {
                  courseDescription = val;
                },
              ),

              ...termDefinition.asMap().entries.map((entry) {
                int index = entry.key;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: buildTermDefinitionContainer(context),
                );
              }).toList(),
              SizedBox(height: 20),
              buildTermDefinitionContainer(context),
              SizedBox(height: 30),
              blueButton(context, label: "Save", navigateTo: HomePage()),
              
            ],
          ),
        ),
      ),
    );
  }
}