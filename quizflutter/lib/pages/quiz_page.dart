import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quizflutter/clases/question.dart';
import 'package:quizflutter/clases/quiz.dart';
import 'package:quizflutter/pages/result_page.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int totalQuestions = 5;
  int totalOptions = 4;
  int questionIndex = 0;
  int progressIndicator = 0;
  Quiz quiz = Quiz(name: 'Quiz de Capitales', questions: []);

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/paises.json');
    final List<dynamic> data = await json.decode(response);
    List<int> optionList = List<int>.generate(data.length, (index) => index);
    List<int> questionsAdded = [];

    while (true) {
      optionList.shuffle();
      int answer = optionList[0];
      if (questionsAdded.contains(answer)) continue;
      questionsAdded.add(answer);
      List<String> otherOptions = [];
      for (var option in optionList.sublist(1, totalOptions)) {
        otherOptions.add(data[option]['capital']);
      }

      Question question = Question.fromJson(data[answer]);
      question.addOptions(otherOptions);
      quiz.questions.add(question);
      if (quiz.questions.length >= totalQuestions) break;
    }
    setState(() {});
  }

  @override
  //creo funcion
  void initState() {
    super.initState();
    readJson();
  }

  void _optionSelected(String selected) {
    quiz.questions[questionIndex].selected = selected;
    if (selected == quiz.questions[questionIndex].answer) {
      quiz.questions[questionIndex].correct = true;
      quiz.right += 1;
    }
    progressIndicator += 1;

    if (questionIndex < totalQuestions - 1) {
      questionIndex += 1;
    } else {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) => _buildResultDialog(context));
    }
    setState(() {});
  }

  //metodo que regresara un widget
  Widget _buildResultDialog(BuildContext context) {
    return AlertDialog(
      title: Text('Resultados', style: Theme.of(context).textTheme.headline1),
      backgroundColor: Theme.of(context).primaryColorDark,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Preguntas Totales:$totalQuestions',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Correctas:${quiz.right}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Incorrectas:${(totalQuestions - quiz.right)}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            'Porcentaje:${quiz.percent}%',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => ResultsPage(
                        quiz: quiz,
                      )),
            );
          },
          child: Text(
            'Ver Respuestas',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 30.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: LinearProgressIndicator(
                color: Colors.amber.shade900,
                value: progressIndicator / totalQuestions,
                minHeight: 20.0,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: quiz.questions.isNotEmpty
                  ? Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: Text(
                              quiz.questions[questionIndex].question,
                              style: Theme.of(context).textTheme.headline1,
                            ),
                          ),
                          Flexible(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: totalOptions,
                              itemBuilder: (_, index) {
                                return Container(
                                  margin: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.indigo.shade100,
                                          width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(15.0)),
                                  child: ListTile(
                                    shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(12.0))),
                                    leading: Text('${index + 1}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1),
                                    title: Text(
                                      quiz.questions[questionIndex]
                                          .options[index],
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                    onTap: () {
                                      _optionSelected(quiz
                                          .questions[questionIndex]
                                          .options[index]);
                                    },
                                  ),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    )
                  : const CircularProgressIndicator(
                      backgroundColor: Colors.white,
                    ),
            ),
          ),
          TextButton(
            onPressed: () {
              _optionSelected('Skipped');
            },
            child: Text('skip', style: Theme.of(context).textTheme.bodyText1),
          ),
        ],
      ),
    );
  }
}
