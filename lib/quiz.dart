import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './main.dart';

class Quiz extends StatefulWidget {

   int _index= 0;
   final List as;
   List buttons;

  Quiz(this.as,this.buttons){
    print("as length in quiz ${as.length}              ");
    //print("sssssssssssssssssssssssssss");
   }

  @override
  _QuizState createState(){
    //print("aaaaaaaaaaaaaaaaaaaaa");
    return _QuizState();}
}

class _QuizState extends State<Quiz> {

  bool click =true;
  int qestionNo=1;

  _QuizState(){
   // print("cccccccccccccccccccccccccccccccc");
  }

   void _reset() {
     setState(() {
       widget._index = 0;
       qestionNo = 01;
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


  var one = Colors.black;
  var two = Colors.black;
  var three = Colors.black;
  var four = Colors.black;


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

          qestionNo =qestionNo +1;
          one = Colors.black;
           two = Colors.black;
           three = Colors.black;
           four = Colors.black;
            // print(widget._index);
          widget._index = widget._index + 1;
          click =true;

          print(" index value after btn  ${widget._index}");

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
          //print(widget._index);
        }

        );
      }
      );

  }


  var fontStyle =TextStyle(
      fontFamily: "OleoScript",
      fontSize: 30,
  );
  var fontStyle2 =TextStyle(
    fontFamily: "OleoScript",
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {

    //print("bbbbbbbbbbb$four");
    print(" index value  ${widget._index}");
    //print("as data in quiz ${widget.as}");

    return WillPopScope(
      onWillPop: exit,
      child: Scaffold(

        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[

           // Text("Score +5",style: TextStyle(color: four),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 40),
                  elevation: 4,
                  shape: CircleBorder(side: BorderSide(style:BorderStyle.none,),),
                  child: Container(
                    height: 60,
                    width: 50,
                    alignment: Alignment.center,
                   // margin: EdgeInsets.only(top: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Right",
                          style: fontStyle2,),
                        Text(
                            "$qestionNo",
                            style: fontStyle2 ),
                      ],
                    ),
                  ),
                ),

                Card(
                  margin: EdgeInsets.only(top: 8),
                  elevation: 4,
                  shape: CircleBorder(side: BorderSide(style:BorderStyle.none,),),
                  child: Container(
                    height: 90,
                    width: 100,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(
                          "Question",
                          style: fontStyle2,),
                        Text(
                            "$qestionNo",
                            style: fontStyle2 ),
                      ],

                    ),
                  ),
                ),
                Card(
                 margin: EdgeInsets.only(top: 40),
                  elevation: 4,
                  shape: CircleBorder(side: BorderSide(style:BorderStyle.none,),),
                  child: Container(
                    height: 65,
                    width: 60,
                    alignment: Alignment.center,
                    //margin: EdgeInsets.only(top: 13),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[

                        Text(
                          "Wrong",
                          style: fontStyle2,),
                        Text(
                            "$qestionNo",
                            style: fontStyle2 ),
                      ],

                    ),
                  ),
                ),
              ],),



            widget._index != widget.as.length -1
            ? Column(children: <Widget>[

              SizedBox(height: 20,),

        Text( utf8.decode(base64Decode(widget.as[widget._index]['question'])) ,

          style: fontStyle,

          textAlign: TextAlign.center,
        ),
              SizedBox(height: 20,),
                 OutlineButton(child: Text(
                   utf8.decode(base64Decode(widget.buttons[0]),),style: fontStyle2,),

                     borderSide: BorderSide( color: one,width: 2.0,style: BorderStyle.solid,),

                     onPressed: (){
                      if(click){
                   btn(context, widget.buttons[0],1);}
                 }),

              OutlineButton(child: Text(
                  utf8.decode(base64Decode(widget.buttons[1])),style: fontStyle2,
              ),
                  borderSide: BorderSide( color: two,width: 2.0,style: BorderStyle.solid),
                  onPressed: (){
                     if(click){
                btn(context, widget.buttons[1],2);}
              }),
              OutlineButton(child: Text(
                  utf8.decode(base64Decode(widget.buttons[2])),style: fontStyle2,
                  //widget.buttons[2]
              ),
                  borderSide: BorderSide( color: three,width: 2.0,style: BorderStyle.solid),
                  onPressed: (){
                 if(click){
                btn(context, widget.buttons[2],3);}
              }),OutlineButton(child: Text(
                  utf8.decode(base64Decode(widget.buttons[3])),style: fontStyle2,
                 // widget.buttons[3]
              ),
                  borderSide: BorderSide( color: four,width: 2.0,style: BorderStyle.solid),
                  onPressed: (){
                if(click){
                btn(context, widget.buttons[3],4);}
              })
            ],): Center(child: RaisedButton( child:Text("restart the game") , onPressed: _reset),),
          ],),
      ),
    )

    ;
  }
}
