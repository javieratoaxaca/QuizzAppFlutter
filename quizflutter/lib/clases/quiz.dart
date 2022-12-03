import 'package:quizflutter/clases/question.dart';

class Quiz {
  String name;
  List<Question> questions;
  int right = 0;

//creacion del constructor
  Quiz({required this.name, required this.questions});

  double get percent => ((right / questions.length) * 100);
}
