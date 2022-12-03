import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColorDark,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30.0, bottom: 50.0),
              child: Icon(
                Icons.wb_sunny_outlined,
                size: 100.0,
                color: Colors.purple.shade100,
              ),
            ),
            Card(
              margin: const EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              color: Theme.of(context).primaryColorLight,
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.all(15.0),
                children: [
                  Container(
                    height: 50.0,
                    margin: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                    child: const Center(
                      child: Text(
                        'Quiz App',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.indigo.shade200,
                              Colors.purple.shade300,
                            ]),
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/quiz_page');
                    },
                    child: Text('Iniciar Quiz'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      elevation: 4.0,
                      side: const BorderSide(width: 1.0),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/review_quiz_page');
                    },
                    child: Text('Repasar Quiz'),
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                      backgroundColor: Theme.of(context).primaryColorLight,
                      elevation: 4.0,
                      side: const BorderSide(width: 1.0),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
