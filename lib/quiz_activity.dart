import 'package:flutter/material.dart';

import './quiz.dart';

class QuizActivity extends StatefulWidget {
  List jj;
  QuizActivity(this.jj);
  @override
  _QuizActivityState createState() => _QuizActivityState();
}

class _QuizActivityState extends State<QuizActivity> {



  var _index = 0;
  void _onPass(BuildContext context, String rightAnswer, int score) {
    setState(() {
      _index = _index + 1;
      //_totalScore +=score;
    });

//   var alert = AlertDialog(title: Text("result"),
//   content: Text('your score is $score'),
//     actions: <Widget>[
//       RaisedButton(
//           child: Text("Ok",),
//            textColor: Colors.black,
//           onPressed: (){ Navigator.pop(context);})],
//   );
//
//   showDialog(context: context,builder: (BuildContext context){
//     return alert;
//   });
  }

  void _reset() {
    setState(() {
      _index = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("app"),),
       body: Column(children: <Widget>[
        Text("Score +5"),

          _index <widget.jj.length
            ? Quiz(_onPass,widget.jj,_index,)
            : Center(child: RaisedButton( child:Text("restart the game") , onPressed: _reset),),
      ],),
    );
  }
}
