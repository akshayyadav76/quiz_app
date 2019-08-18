import 'package:flutter/material.dart';

import './quiz.dart';

class QuizActivity extends StatefulWidget {
  List jj;
  Map jsonData;
  List as;
  QuizActivity(this.jj,this.jsonData,this.as);
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
    print(widget.as.length);
    print(widget.as);
    return Scaffold(
      appBar: AppBar(title: Text("app"),),
       body: Column(children: <Widget>[
        Text("Score +5"),

          _index <widget.jj.length
            ? Quiz(_onPass,widget.jj,_index,widget.jsonData,widget.as)
            : Center(child: RaisedButton( child:Text("restart the game") , onPressed: _reset),),
      ],),
    );
  }
}
