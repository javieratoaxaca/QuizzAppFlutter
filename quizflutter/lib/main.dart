import 'package:flutter/material.dart';
import 'package:quizflutter/pages/home_page.dart';
import 'package:quizflutter/pages/quiz_page.dart';
import 'package:quizflutter/pages/review_quiz_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.indigo,
          textTheme: TextTheme(
            headline1: TextStyle(
              color: Colors.white,
              fontSize: 30.0,
              fontWeight: FontWeight.w500,
              shadows: [
                Shadow(
                  color: Colors.purple.shade50.withOpacity(.3),
                  offset: const Offset(3, 3),
                  blurRadius: 10,
                ),
              ],
            ),
            headline2: TextStyle(
              color: Colors.purple.shade50,
              fontSize: 20.0,
            ),
            bodyText1: TextStyle(
              color: Colors.purple.shade50,
              fontSize: 18,
            ),
          ),
          cardTheme: CardTheme(
            elevation: 6,
            color: Colors.purple.shade700,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
          )),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/quiz_page': (context) => const QuizPage(),
        '/review_quiz_page': (context) => const ReviewQuizPage(),
      },
    );
  }
}
