import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Function press;

  Answer(this.press);

  @override
  Widget build(BuildContext context) {
    return  RaisedButton(child: Text("answer 1"),onPressed: ()=> press(context,"answer 1"));
  }
}
