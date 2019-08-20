import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './quiz.dart';

class QuizActivity extends StatefulWidget {
  List as;
  QuizActivity(this.as);
  @override
  _QuizActivityState createState() => _QuizActivityState();
}

class _QuizActivityState extends State<QuizActivity> {

  var _index = 0;

  void _onPass(BuildContext context, String rightAnswer,) {

    new Future.delayed(new Duration(seconds: 3), () {
      setState(() {
        _index = _index + 1;
        //_totalScore +=score;
      });
    }
    );



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

    void ok(){

    }

    Future<bool> exit() async {

      var alert=AlertDialog(content: Text("Do You Want To Exti"),
       actions: <Widget>[
         OutlineButton(child: Text("Ok"),),
         OutlineButton(child: Text("Cancle"),)
       ],);
    }

  }

  void _reset() {
    setState(() {
      _index = 0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exit,
      child: Scaffold(
        appBar: AppBar(title: Text("app"),
        leading: Icon(null),
        ),
         body: Column(children: <Widget>[
          Text("Score +5"),
            _index < widget.as.length
              ? Quiz(_onPass,_index,widget.as)
              : Center(child: RaisedButton( child:Text("restart the game") , onPressed: _reset),),
        ],),
      ),
    );
  }
}
