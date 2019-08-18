import 'package:flutter/material.dart';



class Answer extends StatelessWidget {
  final Function press;
  final String answerNo;
  //final int score;


  Answer(this.press, this.answerNo,);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Theme.of(context).primaryColor,
        child: Text(answerNo,style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w600,),),
        onPressed: () => press(context, answerNo),
        shape:  BeveledRectangleBorder(side: BorderSide(
          style: BorderStyle.solid,
          color: Colors.brown,
        ))
    );
  }
}
