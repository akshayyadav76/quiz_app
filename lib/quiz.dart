import 'package:flutter/material.dart';
import './answer.dart';
import './questions.dart';

class Quiz extends StatefulWidget {
   final Function _onPass;
  final int _index;
   List as;
   Function btn;


  Quiz(this._onPass,this._index,this.as,this.btn);

  @override
  _QuizState createState() => _QuizState();}




class _QuizState extends State<Quiz> {





  @override
  Widget build(BuildContext context) {


    List buttons=[
      widget.as[widget._index]['correct_answer'],
      //widget._questions[widget._index]["Answers"][0]["Score"],

      widget.as[widget._index]['incorrect_answers'][0],
      //widget._questions[widget._index]["Answers"][1]["Score"],

      widget.as[widget._index]['incorrect_answers'][1],
      // widget._questions[widget._index]["Answers"][2]["Score"],

      widget.as[widget._index]['incorrect_answers'][2],
      // widget._questions[widget._index]["Answers"][3]["Score"],

    ];
    buttons.shuffle();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        SizedBox(height: 20,),

        Questions(widget.as[widget._index]['question']),

        SizedBox(height: 20,),
        Answer(widget._onPass,buttons[0],as: widget.as,index: widget._index),
        Answer(widget._onPass,buttons[1],as: widget.as,index: widget._index),
        Answer(widget._onPass,buttons[2],as: widget.as,index: widget._index),
        widget.btn(buttons[3]),




      ],);
  }
}
