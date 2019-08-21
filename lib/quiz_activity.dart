import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './quiz.dart';
import './quiz_data.dart';

class QuizActivity extends StatefulWidget {
  List as;
  QuizActivity(this.as);
  @override
  _QuizActivityState createState() => _QuizActivityState();
}

class _QuizActivityState extends State<QuizActivity> {



  Widget btn (String answer){
    String correctAnswer = widget.as[_index]['correct_answer'];
    bool check=false;
    var color= Colors.white;

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


            _index < widget.as.length
              ? Quiz(_index,widget.as)
              : Center(child: RaisedButton( child:Text("restart the game") , onPressed: _reset),),
        ],),


      ),
    );
  }
}
