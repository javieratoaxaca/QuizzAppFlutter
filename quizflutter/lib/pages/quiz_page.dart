import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        title: const Text('Quiz de Capitales'),
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
                value: .5,
                minHeight: 20.0,
              ),
            ),
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 450),
            child: Container(
              margin:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: const EdgeInsets.all(15),
                      child: Text(
                        'Pregunta 1',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (_, index) {
                          return Container(
                            margin: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.indigo.shade100, width: 2.0),
                                borderRadius: BorderRadius.circular(15.0)),
                            child: ListTile(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0))),
                              leading: Text('${index + 1}',
                                  style: Theme.of(context).textTheme.bodyText1),
                              title: Text(
                                'Respuesta',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              onTap: () {},
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'skip',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ],
      ),
    );
  }
}
