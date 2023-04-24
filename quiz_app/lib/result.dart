import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'you completed the quiz';
    if (resultScore < 30) {
      resultText = "you are awesome";
    } else if (resultScore <= 50) {
      resultText = "Pretty likeable";
    } else {
      resultText = 'you failed';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
          ),
          ElevatedButton(
            child: const Text('Restart Quiz'),
            onPressed: () {
              if (resetHandler != null && resetHandler is Function) {
                resetHandler();
              }
            },
          ),
        ],
      ),
    );
  }
}
