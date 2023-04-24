import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answerText; // this means the value saved must be a function
  Answer(this.selectHandler,this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Color.fromARGB(255, 248, 248, 248),
          backgroundColor: Colors.blue, // Set the button's color to blue
        ),
        child: Text(answerText),
        onPressed: () {
          // check if the selectHandler is function. And then execute the function.
          if (selectHandler != null && selectHandler is Function) {
            selectHandler(); // Call the function if it's valid
          }
        },
      ),
    );
  }
}
