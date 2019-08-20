import 'package:flutter/material.dart';
import './answer.dart';
import './questions.dart';

class Quiz extends StatefulWidget {
   final Function _onPass;
   //List _questions;
  final int _index;
 // Map jsonData;
  List as;


  Quiz(this._onPass,this._index,this.as);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {




  @override
  Widget build(BuildContext context) {
    print(widget.as);
    List butons=[
    widget.as[widget._index]['correct_answer'],
    //widget._questions[widget._index]["Answers"][0]["Score"],

      widget.as[widget._index]['incorrect_answers'][0],
    //widget._questions[widget._index]["Answers"][1]["Score"],

      widget.as[widget._index]['incorrect_answers'][1],
   // widget._questions[widget._index]["Answers"][2]["Score"],

      widget.as[widget._index]['incorrect_answers'][2],
   // widget._questions[widget._index]["Answers"][3]["Score"],

    ];
    butons.shuffle();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 20,),

        Questions(widget.as[widget._index]['question']),

        SizedBox(height: 20,),
        Answer(widget._onPass,butons[0],as: widget.as,index: widget._index),
        Answer(widget._onPass,butons[1],as: widget.as,index: widget._index),
        Answer(widget._onPass,butons[2],as: widget.as,index: widget._index),
        Answer(widget._onPass,butons[3],as: widget.as,index: widget._index),




      ],);
  }
}
