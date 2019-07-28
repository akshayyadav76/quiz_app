import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String ques;
  Questions(this.ques);

  @override
  Widget build(BuildContext context) {
    return Text(ques,
        style: TextStyle(
        fontWeight:FontWeight.w600 ,
        fontSize: 30.0),textAlign: TextAlign.center,);
  }
}
