import 'package:flutter/material.dart';
import './answer.dart';
import './questions.dart';

class Quiz extends StatefulWidget {
   final Function _onPass;
   List _questions;
  final int _index;
  Map jsonData;
  List as;


  Quiz(this._onPass,this._questions,this._index,this.jsonData,this.as);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {




  @override
  Widget build(BuildContext context) {
    List butons=[
    widget._questions[widget._index]["Answers"][0]["Text"],
    //widget._questions[widget._index]["Answers"][0]["Score"],

    widget._questions[widget._index]["Answers"][1]["Text"],
    //widget._questions[widget._index]["Answers"][1]["Score"],

    widget._questions[widget._index]["Answers"][2]["Text"],
   // widget._questions[widget._index]["Answers"][2]["Score"],

    widget._questions[widget._index]["Answers"][3]["Text"],
   // widget._questions[widget._index]["Answers"][3]["Score"],

    ];
    butons.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 20,),

        Questions(widget.as[0]['question']),

        SizedBox(height: 20,),
        Answer(widget._onPass,butons[0]),
        Answer(widget._onPass,butons[1]),
        Answer(widget._onPass,butons[2]),
        Answer(widget._onPass,butons[3]),




      ],);
  }
}
