import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:quizflutter/clases/quiz.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({super.key, required this.quiz});
  final Quiz quiz;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        title: Text(quiz.name),
        backgroundColor: Theme.of(context).primaryColorDark,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10.0),
              margin:
                  const EdgeInsets.only(left: 2, right: 2, top: 2, bottom: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.indigo.shade50,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Preguntas:${quiz.questions.length}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    'Correctas:${quiz.percent}%',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: quiz.questions.length,
                itemBuilder: (_, index) {
                  return Card(
                    color: quiz.questions[index].correct
                        ? Colors.green.shade200
                        : Colors.red.shade200,
                    child: ListTile(
                      leading: quiz.questions[index].correct
                          ? Icon(Icons.check, color: Colors.green.shade900)
                          : Icon(
                              Icons.close,
                              color: Colors.red.shade900,
                            ),
                      title: Text(
                        quiz.questions[index].question,
                      ),
                      subtitle: Text(
                        quiz.questions[index].selected,
                      ),
                      trailing: Text(
                        quiz.questions[index].answer,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
