import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './main.dart';
import './madel.dart';
import './solutions.dart';

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
  int qestionNo = 1;
  int right = 0;
  int wrong = 0;

  var one = Colors.black;
  var two = Colors.black;
  var three = Colors.black;
  var four = Colors.black;


  List<String> rightWrong=[];
var boderNone=CircleBorder(side: BorderSide(style: BorderStyle.none,));
var lastButtonsBorder= BorderSide(color: Colors.black, width: 2.0, style: BorderStyle.solid);


  void _reset() {

    setState(() {
      widget._index = 0;
      qestionNo = 01;
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

    Future.delayed(new Duration(seconds: 2), () {
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

          qestionNo = qestionNo + 1;

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
          widget.buttons=widget.saveButtons;
        }
        //print(widget._index);
      });
    });
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
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)
                    * 0.2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Card(
                      margin: EdgeInsets.only(top: 40),
                      elevation: 4,
                      shape: boderNone,
                      child: Container(
                        height: 60,
                        width: 50,
                        alignment: Alignment.center,
                        // margin: EdgeInsets.only(top: 13),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text("Right", style: Theme.of(context).textTheme.title),
                              Text("$right",
                                  style:Theme.of(context).textTheme.subtitle),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(top: 12),
                      elevation: 4,
                      shape: boderNone,
                      child: Container(
                        height: 90,
                        width: 100,
                        alignment: Alignment.center,
                       // margin: EdgeInsets.only(top: 4),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              "Question",
                              style: Theme.of(context).textTheme.headline,
                            ),
                            Text("$qestionNo", style:  Theme.of(context).textTheme.headline,),
                          ],
                        ),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.only(top: 40),
                      elevation: 4,
                      shape:boderNone,
                      child: Container(
                        height: 60,
                        width: 50,
                        alignment: Alignment.center,
                        //margin: EdgeInsets.only(top: 13),
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "Wrong",
                                style: Theme.of(context).textTheme.title,
                              ),
                              Text("$wrong",
                                  style: Theme.of(context).textTheme.button,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              widget._index < widget.as.length
                  ? Container(
                height: (MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top)  *0.8,
                child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    utf8.decode(
                        base64Decode(widget.as[widget._index]['question'])),
                    style:  TextStyle( fontSize: 28),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                ],
              )
                ,)

                  : Container(
              // height:(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top) *0.8,
                      child: Column(
                      children: <Widget>[
                            Container(
                                height:(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top) *0.56,
                                child:
                                Madel(widget.as.length,right)),

                        Container(
                          height:(MediaQuery.of(context).size.height-MediaQuery.of(context).padding.top) *0.24,
                              child: Column(children: <Widget>[
                                Text("Points: ${right*3}",style: Theme.of(context).textTheme.title,),
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
                            )
                      ],
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
