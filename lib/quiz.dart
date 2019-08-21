import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './answer.dart';
import './questions.dart';

class Quiz extends StatefulWidget {
   //final Function _onPass;
   int _index= 0;
   final List as;
   List buttons;
 //  final Function btn;

   //List buttons;


  Quiz(this.as,this.buttons){

    print("sssssssssssssssssssssssssss");
   }

  @override
  _QuizState createState(){print("aaaaaaaaaaaaaaaaaaaaa");return _QuizState();}
}

class _QuizState extends State<Quiz> {
  //List buttons;

   //var _index = 0;
  _QuizState(){
    print("cccccccccccccccccccccccccccccccc");
  }


//   void _onPass(BuildContext context, String rightAnswer,) {
//     Future.delayed(new Duration(seconds: 2), () {
//
//       setState(() {
//         widget._index = widget._index + 1;
//         //_totalScore +=score;
//       }
//       );
//     }
//     );
//   }


   void _reset() {
     setState(() {
       widget._index = 0;
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
  bool check = false;

  Widget btn (String answer){
    String correctAnswer = widget.as[widget._index]['correct_answer'];
    var color = Colors.white;

    return RaisedButton(

        color: check ? Colors.green:Theme.of(context).primaryColor ,
        child: Text(answer,
            style: TextStyle(fontSize: 23.0,fontWeight: FontWeight.w600,
            )
        ),
        onPressed: (){

        setState(() {
          print(check);
          if( answer == correctAnswer){
            check = true;
          }
          print(check);
        });

        Future.delayed(new Duration(seconds: 2), () {
          print(check);
          setState(() {
            widget._index = widget._index + 1;
            print(check);

            widget.buttons =[
              widget.as[widget._index]['correct_answer'],
              //widget._questions[widget._index]["Answers"][0]["Score"],

              widget.as[widget._index]['incorrect_answers'][0],
              //widget._questions[widget._index]["Answers"][1]["Score"],

              widget.as[widget._index]['incorrect_answers'][1],
              // widget._questions[widget._index]["Answers"][2]["Score"],

              widget.as[widget._index]['incorrect_answers'][2],
              // widget._questions[widget._index]["Answers"][3]["Score"],

            ];
            widget.buttons.shuffle();
          }
          );
        }
        );

        },
        shape:  BeveledRectangleBorder(side: BorderSide(
          style: BorderStyle.solid,
          color: Colors.brown,
        ))
    );
  }



  @override
  Widget build(BuildContext context) {
    print("bbbbbbbbbbbbbbbbbbbbbbbbbbbbbbb");

    return WillPopScope(
      onWillPop: exit,
      child: Scaffold(
        appBar: AppBar(title: Text("app"),
          leading: Icon(null),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Score +5"),

            widget._index < widget.as.length
            ? Column(children: <Widget>[

              SizedBox(height: 20,),

              Questions(widget.as[widget._index]['question']),

              SizedBox(height: 20,),
              btn(widget.buttons[0]),
              btn(widget.buttons[1]),
              btn(widget.buttons[2]),
              btn(widget.buttons[3])
            ],): Center(child: RaisedButton( child:Text("restart the game") , onPressed: _reset),),
          ],),
      ),
    )

    ;
  }
}
