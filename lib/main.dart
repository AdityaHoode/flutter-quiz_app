import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/questions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionNumber = 0;
  int currentScore = 0;

  Questions questions = Questions();

  void updateQ() {
    setState(() {
      questionNumber += 1;
    });
  }

  bool checkQ(int questionNumber) {
    return questionNumber < questions.questionBank.length ? true : false;
  }

  void updateScore(bool choice, int questionNumber) {
    if (questionNumber == questions.questionBank.length) {
      print("End of questions");
    } else {
      if (questions.questionBank[questionNumber].answer == choice) {
        setState(() {
          currentScore += 1;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('Quiz'),
          ),
          body: Container(
            margin: EdgeInsets.all(10.0),
            padding: EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    checkQ(questionNumber)
                        ? questions.questionBank[questionNumber].questionText
                            .toString()
                        : "End",
                    style: TextStyle(fontSize: 40.0),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                if (checkQ(questionNumber))
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (questionNumber == questions.questionBank.length) {
                          print("End of questions");
                        } else {
                          updateScore(true, questionNumber);
                          updateQ();
                        }
                      });
                    },
                    child: Text(
                      "TRUE",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                if (checkQ(questionNumber))
                  RaisedButton(
                    onPressed: () {
                      setState(() {
                        if (questionNumber == questions.questionBank.length) {
                          print("End of questions");
                        } else {
                          updateScore(false, questionNumber);
                          updateQ();
                        }
                      });
                    },
                    child: Text(
                      "FALSE",
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ),
                SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: Text(
                    "Your Score",
                    style: TextStyle(fontSize: 30.0),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Center(
                  child: Text(
                    '$currentScore',
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
