import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz(
      {required this.questions,
      required this.answerQuestion,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText']
              .toString(), // we convert it to the string because questionText value is expetec to be String by the 'Question' Widget
        ), //we can also use elementAt method

        // below code return the answer for the specific question
        // the parethesis in the first tells that the answers is the list[]. we did that because dart cannot detects on it own.
        // and as  List<String> tells that we will have specifice types and we know that this will be of type List full of String.
        // at last we used toList() method to tell dart that we don't want it to return map but List[].
        // ... it takes a list and pulled all the values in the list out of it and add then to the surroding list as the individual list.
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer['score']), answer['text'] as String);
        }).toList()
      ],
    );
  }
}
