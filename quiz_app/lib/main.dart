import 'package:flutter/material.dart';
import 'quiz.dart';
import 'result.dart';

void main() {
  runApp(MyApp());
}

// to create a widget we need a class because it is special type of object

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createSate
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    //using map
    {
      'questionText': 'what\'s your fav color',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'white', 'score': 1},
        {'text': 'Green', 'score': 19},
        {'text': 'purple', 'score': 15},
      ],
    },
    {
      'questionText': 'what\'s you fav animal',
      'answers': [
        {'text': 'Rabbit', 'score': 10},
        {'text': 'Cat', 'score': 20},
        {'text': 'Dog', 'score': 30},
        {'text': 'Lion', 'score': 40},
      ],
    },
    {
      'questionText': 'who\'s you fav person',
      'answers': [
        {'text': 'person1', 'score': 10},
        {'text': 'person2', 'score': 10},
        {'text': 'person3', 'score': 10},
        {'text': 'person4', 'score': 10},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print("we still got question");
    } else {
      print("No more question");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My first App'),
        ),
        // use of ternary operator in the body.
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
