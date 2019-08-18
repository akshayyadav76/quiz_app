import 'package:flutter/material.dart';
import './answer.dart';
import './questions.dart';

class Quiz extends StatelessWidget {
  final Function _onPass;
  final List _questions;
  final int _index;
  Map jsonData;
  List as;


  Quiz(this._onPass,this._questions,this._index,this.jsonData,this.as);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 20,),

        Questions(as[0]['question']),

        SizedBox(height: 20,),

        Answer(_onPass,_questions[_index]["Answers"][0]["Text"],_questions[_index]["Answers"][0]["Score"]),
        Answer(_onPass,_questions[_index]["Answers"][1]["Text"],_questions[_index]["Answers"][1]["Score"]),
        Answer(_onPass,_questions[_index]["Answers"][2]["Text"],_questions[_index]["Answers"][2]["Score"]),
        Answer(_onPass,_questions[_index]["Answers"][3]["Text"],_questions[_index]["Answers"][3]["Score"]),

      ],);
  }
}
