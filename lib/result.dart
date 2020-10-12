import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;
  Result(this.resultScore, this.resetHandler);

  String get resultPharase {
    String resultText;
    if (resultScore <= 40) {
      resultText = "You are fine!";
    } else if (resultScore <= 60) {
      resultText = "You are not bad but not Cool!";
    } else if (resultScore <= 100) {
      resultText = "You are very Cool!";
    } else {
      resultText = "You are AWESOME!";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPharase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              "Restart Quiz",
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          )
        ],
      ),
    );
  }
}
