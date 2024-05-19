import 'package:quizlet_flashcard/model/quiz.dart';

class Course {
  String id;
  String title;
  String userId;
  List<Quiz> quizz;

  Course({required this.id, required this.userId, required this.title, required this.quizz});
}