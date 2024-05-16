import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import '../widgets/widget.dart';


class CreateQuiz extends StatefulWidget {
  @override
  _CreateQuizState createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {

  final _formkKey = GlobalKey<FormState>();
  late String quizImageURL, quiztitle, quizDescription;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appBar(context),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.black87),
        elevation: 0.0,
      ),
      backgroundColor: authThemeColor,
      body: Form(
        key: _formkKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter Image URL" : null,
                decoration: InputDecoration(hintText: "Quiz Image URL"),
                onChanged: (val){
                  quizImageURL = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter Quiz title" : null,
                decoration: InputDecoration(hintText: "Quiz title"),
                onChanged: (val){
                  quizImageURL = val;
                },
              ),
              SizedBox(height: 6,),
              TextFormField(
                validator: (val) => val!.isEmpty ? "Enter Quiz description" : null,
                decoration: InputDecoration(hintText: "Quiz description"),
                onChanged: (val){
                  quizImageURL = val;
                },
              ),
              Spacer(),
              blueButton(context, "Create Quiz"),
              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
    );
  }
}