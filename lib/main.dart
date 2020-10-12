import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/result.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      "questionText": "Whats your favorite color?",
      "answers": [
        {"text": "Black", "score": 10},
        {"text": "Blue", "score": 20},
        {"text": "White", "score": 30},
        {"text": "Purple", "score": 40}
      ],
    },
    {
      "questionText": "Whats your favorite animal?",
      "answers": [
        {"text": "Monkey", "score": 10},
        {"text": "Duck", "score": 30},
        {"text": "Cat", "score": 40},
        {"text": "Dog", "score": 20}
      ],
    },
    {
      "questionText": "Whats your favorite number?",
      "answers": [
        {"text": "3", "score": 10},
        {"text": "5", "score": 40},
        {"text": "8", "score": 30},
        {"text": "10", "score": 20}
      ],
    },
    {
      "questionText": "Whats your favorite series?",
      "answers": [
        {"text": "Sen Cal Kapimi", "score": 40},
        {"text": "Mucize Doktor", "score": 30},
        {"text": "HIMYM", "score": 20},
        {"text": "Sense 8", "score": 10}
      ],
    },
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });

  }

  void _answerQuestion(int score) {

    //_totalScore = _totalScore + score; => equals += operator
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print("We have more questions.");
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
