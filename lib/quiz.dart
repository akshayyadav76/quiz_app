import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './answer.dart';
import './questions.dart';
import './main.dart';

class Quiz extends StatefulWidget {
   //final Function _onPass;
   int _index= 0;
   final List as;
   List buttons;


  Quiz(this.as,this.buttons){
           print("list quiz ${as.length}");
    print("sssssssssssssssssssssssssss");
   }

  @override
  _QuizState createState(){print("aaaaaaaaaaaaaaaaaaaaa");return _QuizState();}
}

class _QuizState extends State<Quiz> {
  //List buttons;

   //var _index = 0;
  bool click =true;
  _QuizState(){
    print("cccccccccccccccccccccccccccccccc");
  }


   void _reset() {
     setState(() {
       widget._index = 1;
     });
   }

   Future<bool> exit() async {

     var alert = AlertDialog(content: Text("Do You Want To Exti?"),
       actions: <Widget>[
         OutlineButton(child: Text("Ok"),onPressed: (){SystemNavigator.pop();},),
         OutlineButton(child: Text("Cancle"),onPressed: (){Navigator.of(context).pop();},),
         OutlineButton(child: Text("Reset"),onPressed: (){

           Navigator.of(context).push(MaterialPageRoute(builder: (context){
             return App();
           }));
         },)
       ],);

     showDialog(context: context,builder: (context){
       return alert;
     });
     return null;
   }
  var one = Colors.grey;
  var two = Colors.grey;
  var three = Colors.grey;
  var four = Colors.grey;


  void btn (BuildContext context ,String answer ,int num){

    setState(() {
      click= false;
    });

    String correctAnswer = widget.as[widget._index]['correct_answer'];

    print(answer);
    print(num);

        switch(num){
          case 4: setState(() {

            if (answer == correctAnswer) {

              four = Colors.green;
            } else {
              four = Colors.red;

            }
          });
          break;
          case 3: setState(() {
            if (answer == correctAnswer) {
              three= Colors.green;
            } else {
              three = Colors.red;
            }
          });
          break;
          case 2: setState(() {
            if (answer == correctAnswer) {
              two = Colors.green;
            } else {
              two = Colors.red;
            }
          });
          break;
          case 1: setState(() {
            if (answer == correctAnswer) {
              one = Colors.green;
            } else {
              one = Colors.red;
            }
          });
        }

      Future.delayed(new Duration(seconds: 2), () {
        setState(() {

          one = Colors.grey;
           two = Colors.grey;
           three = Colors.grey;
           four = Colors.grey;
             print(widget._index);
          widget._index = widget._index + 1;
          click =true;

          print(widget._index);

          widget.buttons = [
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
          print(widget._index);
        }

        );
      }
      );

  }



  @override
  Widget build(BuildContext context) {

    print("bbbbbbbbbbb$four");


    return WillPopScope(
      onWillPop: exit,
      child: Scaffold(
        appBar: AppBar(title: Text("app"),
          leading: Icon(null),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text("Score +5",style: TextStyle(color: four),),

            widget._index < widget.as.length -1
            ? Column(children: <Widget>[

              SizedBox(height: 20,),

        Text(widget.as[widget._index]['question'],
          style: TextStyle(
              fontWeight:FontWeight.w600 ,
              fontSize: 30.0),textAlign: TextAlign.center,),

              SizedBox(height: 20,),


                 OutlineButton(child: Text(widget.buttons[0]),
                     borderSide: BorderSide( color: one,width: 6.0,style: BorderStyle.solid),
                     onPressed: (){
                      if(click){
                   btn(context, widget.buttons[0],1);}
                 }),
              OutlineButton(child: Text(widget.buttons[1]),
                  borderSide: BorderSide( color: two,width: 6.0,style: BorderStyle.solid),
                  onPressed: (){
                     if(click){
                btn(context, widget.buttons[1],2);}
              }),
              OutlineButton(child: Text(widget.buttons[2]),
                  borderSide: BorderSide( color: three,width: 6.0,style: BorderStyle.solid),
                  onPressed: (){
                 if(click){
                btn(context, widget.buttons[2],3);}
              }),OutlineButton(child: Text(widget.buttons[3]),
                  borderSide: BorderSide( color: four,width: 6.0,style: BorderStyle.solid),
                  onPressed: (){
                if(click){
                btn(context, widget.buttons[3],4);}
              })


//              btn(context,widget.buttons[0]),
//              btn(context,widget.buttons[1]),
//              btn(context,widget.buttons[2]),
//              btn(context,widget.buttons[3])
            ],): Center(child: RaisedButton( child:Text("restart the game") , onPressed: _reset),),
          ],),
      ),
    )

    ;
  }
}
