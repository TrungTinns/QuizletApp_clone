import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/views/home/home.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import '../../widgets/widget.dart';

class CreateClass extends StatefulWidget {
  @override
  _CreateClassState createState() => _CreateClassState();
}

class _CreateClassState extends State<CreateClass> {
  final _formKey = GlobalKey<FormState>();
  late String className, classDescription;
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
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
                  'Create new class',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                autofocus: true,
                validator: (val) => val!.isEmpty ? "Enter class name" : null,
                style: const TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: const InputDecoration(
                  helperText: "Class name",
                  hintText: "Subject, course, semester",
                  hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                  helperStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  )
                ),
                onChanged: (val) {
                  className = val;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                style: const TextStyle(color: textColor),
                cursorColor: textColor,
                decoration: const InputDecoration(
                  helperText: "Description (optional)",
                  hintText: "Additional information (otional)",
                  hintStyle: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.5)),
                  helperStyle: TextStyle(color: textColor),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                  )
                ),
                onChanged: (val) {
                  classDescription = val;
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text(
                    'Allows members to add new courses and members', 
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(width: 10),
                  Switch(
                    value: isSwitched,
                    activeColor: Colors.blue,
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                      print("VALUE : $value");
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              blueButton(context, label: "Save", navigateTo: HomePage()),
              
            ],
          )
        )
      )
    );
  }
}