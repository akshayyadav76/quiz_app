import 'package:flutter/material.dart';



class Answer extends StatelessWidget {
  final Function press;
  final String answerNo;
   List as;
   int index;
  //final int score;


  Answer(this.press, this.answerNo,{this.as,this.index});

  @override
  Widget build(BuildContext context) {
    String correctAnswer = as[index]['correct_answer'];

    return RaisedButton(
        color:  answerNo == correctAnswer ? Colors.green : Theme.of(context).primaryColor ,
        child: Text(answerNo,
            style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w600,
            )
        ),
        onPressed: () => press(context, answerNo,),
        shape:  BeveledRectangleBorder(side: BorderSide(
          style: BorderStyle.solid,
          color: Colors.brown,
        ))
    );
  }
}
