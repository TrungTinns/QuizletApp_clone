
import 'dart:js_interop';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:quizlet_flashcard/model/quiz.dart';
import 'package:quizlet_flashcard/views/learning/flashcard.dart';
import 'package:quizlet_flashcard/views/learning/quiz.dart';
import 'package:quizlet_flashcard/views/learning/typing.dart';
import 'package:quizlet_flashcard/widgets/colors.dart';
import 'package:quizlet_flashcard/widgets/widget.dart';

class DetailedCourses extends StatefulWidget {
  String course;
  DetailedCourses({super.key, required this.course});

  @override
  State<DetailedCourses> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<DetailedCourses> {
  List<Quiz> quizz= [];


  Widget _quizToWidget(Quiz quiz) {
    List<String> answers = List.from(quiz.incorrect_answer);
      if (answers.length < quiz.incorrect_answer.length + 1) {
        answers.add(quiz.correct_answer);
        answers.shuffle();
      }

    return Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                quiz.question,
                style: TextStyle(
                  fontSize: 16
                ),
              ),
              SizedBox(height: 8,),
              Expanded(
                child: Column(
                  children: [
                    ...answers.map((e) {
                      return  Row(
                        mainAxisAlignment: MainAxisAlignment.start ,
                        children: [ 
                          Text(
                            e,
                            style: TextStyle(
                              fontSize: 16
                            ),
                          ),
                        ],
                      );
                    })
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FlashCardScreen(quizz: quizz,))
                      );
                    }, 
                    icon: Icon(Icons.fullscreen)
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    quizz.add(
      Quiz(
        id: "5f9f1b9b0e1b9c0017a5f1a5", 
        category: "music", 
        question:"Who was the 14th president of the USA, in term during the period 1853–1857?", 
        correct_answer: "Franklin Pierce", 
        incorrect_answer:  [
            "James Buchanan",
            "John F. Kennedy",
            "Jimmy Carter"
        ],
         tags:  [
            "presidents",
            "usa",
            "1800's",
            "history"
        ], 
      )
    );
    quizz.add(
      Quiz(
        id: "5f9f1b9b0e1b9c0017a5f1a5", 
        category: "music", 
        question:"The now extinct species &quot;Thylacine&quot; was native to where?", 
        correct_answer: "Franklin Pierce", 
        incorrect_answer:  [
            "James Buchanan",
            "John F. Kennedy",
            "Jimmy Carter"
        ],
         tags:  [
            "presidents",
            "usa",
            "1800's",
            "history"
        ], 
      )
    );
    quizz.add(
      Quiz(
        id: "5f9f1b9b0e1b9c0017a5f1a5", 
        category: "music", 
        question:"Who was the 14th president of the USA, in term during the period 1853–1857?", 
        correct_answer: "Franklin Pierce", 
        incorrect_answer:  [
            "James Buchanan",
            "John F. Kennedy",
            "Jimmy Carter"
        ],
         tags:  [
            "presidents",
            "usa",
            "1800's",
            "history"
        ], 

      )
    );
    quizz.add(
      Quiz(
        id: "5f9f1b9b0e1b9c0017a5f1a5", 
        category: "music", 
        question:"What is the world&#039;s longest venomous snake?", 
        correct_answer: "Franklin Pierce", 
        incorrect_answer:  [
            "James Buchanan",
            "John F. Kennedy",
            "Jimmy Carter"
        ],
         tags:  [
            "presidents",
            "usa",
            "1800's",
            "history"
        ], 
      )
    );
    quizz.add(
      Quiz(
        id: "5f9f1b9b0e1b9c0017a5f1a5", 
        category: "music", 
        question:"Who was the 14th president of the USA, in term during the period 1853–1857?", 
        correct_answer: "Franklin Pierce", 
        incorrect_answer:  [
            "James Buchanan",
            "John F. Kennedy",
            "Jimmy Carter"
        ],
         tags:  [
            "presidents",
            "usa",
            "1800's",
            "history"
        ], 
      )
    );
    super.initState();
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
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.only(top:12.0),
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.folder_copy_outlined),
                          title: Text('Add to Folder'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.people_outline),
                          title: Text('Add to Class'),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(Icons.file_copy_outlined),
                          title: Text('Save and Modify'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      backgroundColor: authThemeColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CarouselSlider(
              items: quizz.map((e) => _quizToWidget(e)).toList(),
              options: CarouselOptions(
                height: 400,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                initialPage: 0,
                autoPlay: false,
              ),
            ),
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
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FlashCardScreen(quizz: quizz,))
                      );
                    },
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
                    onTap: (){
                       Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuizScreen(quizz: quizz,))
                      );
                    },
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
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TypingScreen(quizz: quizz))
                      );
                    },
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