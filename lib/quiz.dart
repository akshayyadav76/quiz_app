import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import './main.dart';
import './solutions.dart';
import './database.dart';
import './model.dart';
import './widgets/row.dart';
import './top_scors.dart';

class Quiz extends StatefulWidget {

  int _index = 0;
  final List as;
   List buttons;
  List saveButtons;

  Quiz(this.as, this.buttons) {
    print("as length in quiz ${as.length}              ");
    //print("sssssssssssssssssssssssssss");
  }

  @override
  _QuizState createState() {
    //print("aaaaaaaaaaaaaaaaaaaaa");
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {


  bool click = true;
  int questionNo = 1;
  int right = 0;
  int wrong = 0;
  String madelName;
  String madelIcon;
  String date;
  String time;



  var one = Colors.black;
  var two = Colors.black;
  var three = Colors.black;
  var four = Colors.black;


  List<String> rightWrong=[];

var lastButtonsBorder= BorderSide(color: Colors.black, width: 2.0, style: BorderStyle.solid);


  void _reset() {

    setState(() {
      widget._index = 0;
      questionNo = 01;
      right = 0;
      wrong = 0;
      rightWrong.clear();
    });
  }

  Future<bool> exit() async {
    var alert = AlertDialog(
      content: Text("Do You Want To Exti?"),
      actions: <Widget>[
        OutlineButton(
          child: Text("Ok"),
          onPressed: () {
            SystemNavigator.pop();
          },
        ),
        OutlineButton(
          child: Text("Cancle"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        OutlineButton(
          child: Text("Reset"),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return App();
            }));
          },
        )
      ],
    );

    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
    return null;
  }


  void btn(BuildContext context, String answer, int num) {
    setState(() {
      click = false;
      rightWrong.add(answer);

      if(widget._index == 0)
        {
          widget.saveButtons = widget.buttons;
        }

    });

    String correctAnswer = widget.as[widget._index]['correct_answer'];

    print(answer);
    print(num);

    switch (num) {
      case 4:
        setState(() {
          if (answer == correctAnswer) {
            four = Colors.green;
            right = right + 1;
          } else {
            four = Colors.red;
            wrong = wrong + 1;
          }
        });
        break;
      case 3:
        setState(() {
          if (answer == correctAnswer) {
            three = Colors.green;
            right = right + 1;
          } else {
            three = Colors.red;
            wrong = wrong + 1;
          }
        });
        break;
      case 2:
        setState(() {
          if (answer == correctAnswer) {
            two = Colors.green;
            right = right + 1;
          } else {
            two = Colors.red;
            wrong = wrong + 1;
          }
        });
        break;
      case 1:
        setState(() {
          if (answer == correctAnswer) {
            one = Colors.green;
            right = right + 1;
          } else {
            one = Colors.red;
            wrong = wrong + 1;
          }
        });
    }

    Future.delayed(new Duration(seconds: 1), () {
      setState(() {
        one = Colors.black;
        two = Colors.black;
        three = Colors.black;
        four = Colors.black;
        // print(widget._index);
        widget._index = widget._index + 1;
        click = true;

        print(" index value after btn  ${widget._index}");

        if (widget._index < widget.as.length) {

          questionNo = questionNo + 1;

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
        }else{
          int zero=   10  ~/ widget.as.length;
          int one =   40  ~/ widget.as.length;
          int two =   70  ~/ widget.as.length;
          int three = 100 ~/ widget.as.length;

          if(right <= zero ){
            madelName ="You don't deserve medal";
           madelIcon= "assets/madel_icons/no_madel.png";
          }

          if (right <= one && right >zero) {
            madelIcon = "assets/madel_icons/bronze.png";
            madelName = "Bronze Madel";
          }
          if (right <= two && right > one) {
            madelIcon = "assets/madel_icons/silver.png";
            madelName = "Silver Madel";
          }
          if (right <= three && right > two) {
            madelIcon = "assets/madel_icons/gold.png";
            madelName = "Gold Madel";
          }
           date = DateFormat("dd-MM-yyyy").format(DateTime.now());
          time = DateFormat("hh:mm:a").format(DateTime.now());
          print("date  $date");
          print("time  $time");


          widget.buttons=widget.saveButtons;
          todo();

        }
        //print(widget._index);
      });
    });
  }


  todo()async{
    DataBaseDB _db=DataBaseDB();

   int saved= await _db.saveData(
       Model(widget.as.length, right, wrong, right*3, madelName, madelIcon, date, time)
   );
   print("sssssssssssssssssssssssssssssssssssssss$saved");
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exit,
      child: Scaffold(
        body: Container(
         // height: MediaQuery.of(context).size.height * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              Container(
                height: MediaQuery.of(context).size.height * 0.2,
              //width: MediaQuery.of(context).size.width *0.2,
                 child:
                 Rows(questionNo, right, wrong),
              ),

              widget._index < widget.as.length
                  ? Container(
                height: MediaQuery.of(context).size.height *0.8,
                child: Column(
                children: <Widget>[

                SizedBox(  height: 10,),

                  Flexible(
                    child: Container(
                      //height: MediaQuery.of(context).size.height *0.3,
                      //width: MediaQuery.of(context).size.height *1,

                             child: Text(
                                  utf8.decode(
                                      base64Decode(widget.as[widget._index]['question'])),
                                  style:  TextStyle( fontSize: 28),
                                  textAlign: TextAlign.center,
                                ),
                    ),
                  ),
                SizedBox(  height: 10),

                    Expanded(
                    child: Container(
                      //height: MediaQuery.of(context).size.height *0.4,
                      child: Column(children: <Widget>[
                        OutlineButton(
                            child: Text(
                              utf8.decode(
                                base64Decode(widget.buttons[0]),
                              ),
                              style: Theme.of(context).textTheme.title,
                            ),
                            borderSide: BorderSide(
                              color: one,
                              width: 2.0,
                              style: BorderStyle.solid,
                            ),
                            onPressed: () {
                              if (click) {
                                btn(context, widget.buttons[0], 1);
                              }
                            }),
                        OutlineButton(
                            child: Text(
                              utf8.decode(base64Decode(widget.buttons[1])),
                              style:Theme.of(context).textTheme.title,
                            ),
                            borderSide: BorderSide(
                                color: two, width: 2.0, style: BorderStyle.solid),
                            onPressed: () {
                              if (click) {
                                btn(context, widget.buttons[1], 2);
                              }
                            }),
                        OutlineButton(
                            child: Text(
                              utf8.decode(base64Decode(widget.buttons[2])),
                              style: Theme.of(context).textTheme.title,
                              //widget.buttons[2]
                            ),
                            borderSide: BorderSide(
                                color: three,
                                width: 2.0,
                                style: BorderStyle.solid),
                            onPressed: () {
                              if (click) {
                                btn(context, widget.buttons[2], 3);
                              }
                            }),
                        OutlineButton(
                            child: Text(
                              utf8.decode(base64Decode(widget.buttons[3])),
                              style:Theme.of(context).textTheme.title,
                              // widget.buttons[3]
                            ),
                            borderSide: BorderSide(
                                color: four,
                                width: 2.0,
                                style: BorderStyle.solid),
                            onPressed: () {
                              if (click) {
                                btn(context, widget.buttons[3], 4);
                              }
                            })
                      ],),
                    ),
                  )

                ],
              )
                ,)

                  : Container(
               //height:MediaQuery.of(context).size.height*0.8,
                      child: Column(
                      children: <Widget>[
                             Container(
                                  height:MediaQuery.of(context).size.height *0.47,
                                  child:Column(
                                    children: <Widget>[
                                      Card(
                                          shape: CircleBorder(),
                                          child:
                                          Image.asset(
                                            madelIcon,
                                            height: MediaQuery.of(context).size.height *0.4,
                                          )
                                      ),
                                      Text(madelName, style: Theme
                                          .of(context)
                                          .textTheme
                                          .title,),
                                    ],
                                  )
                              ),


                         Container(
                            height:MediaQuery.of(context).size.height *0.33,
                                child: Column(children: <Widget>[
                                  Text("Points: ${right*3}",style: Theme.of(context).textTheme.title,),
                                  OutlineButton(
                                      borderSide: lastButtonsBorder,
                                      child:Text("Top Scores",style: Theme.of(context).textTheme.title),
                                      onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                          return TopScors();
                                        }));
                                      }),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      OutlineButton(borderSide: lastButtonsBorder,
                                          child: Text("Restert the Quiz",style: Theme.of(context).textTheme.title,),
                                          onPressed: _reset),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      OutlineButton(
                                          borderSide: lastButtonsBorder,
                                          child: Text("Reset the Quiz",style: Theme.of(context).textTheme.title,),
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(builder: (context) {
                                              return App();
                                            }));
                                          }),

                                    ],
                                  ),
                                  OutlineButton(
                                      borderSide: lastButtonsBorder,
                                      child:Text("Solutions",style: Theme.of(context).textTheme.title),
                                      onPressed: (){
                                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                          return Solutions(widget.as,rightWrong,lastButtonsBorder);
                                        }));
                                      })
                                ],),
                              ),

                      ],
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
