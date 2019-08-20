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
     Future.delayed(new Duration(seconds: 2), () {
      setState(() {
        _index = _index + 1;
        //_totalScore +=score;
      });
    }
    );}

  void _reset() {
    setState(() {
      _index = 0;
    });
  }

  Future<bool> exit() async {

    var alert = AlertDialog(content: Text("Do You Want To Exti?"),
      actions: <Widget>[
        OutlineButton(child: Text("Ok"),onPressed: (){SystemNavigator.pop();},),
        OutlineButton(child: Text("Cancle"),onPressed: (){Navigator.of(context).pop();},)
      ],);

    showDialog(context: context,builder: (context){
      return alert;
    });
    return null;
  }

  Widget btn (String answer){
    String correctAnswer = widget.as[_index]['correct_answer'];
    bool check=false;

    return RaisedButton(
        color: check ?  Colors.green: Theme.of(context).primaryColor,

        child: Text(answer,
            style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w600,
            )
        ),
        onPressed: (){ _onPass(context, answer,);
        setState(() {
          if( answer == correctAnswer){
            check =true;
          }
        });
        },
        shape:  BeveledRectangleBorder(side: BorderSide(
          style: BorderStyle.solid,
          color: Colors.brown,
        ))
    );
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
              ? Quiz(_onPass,_index,widget.as,btn)
              : Center(child: RaisedButton( child:Text("restart the game") , onPressed: _reset),),
        ],),
      ),
    );
  }
}
