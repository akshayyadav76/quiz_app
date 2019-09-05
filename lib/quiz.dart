import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './main.dart';

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

  _QuizState() {
    // print("cccccccccccccccccccccccccccccccc");
  }

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

  var one = Colors.black;
  var two = Colors.black;
  var three = Colors.black;
  var four = Colors.black;

  List<String > rightWrong=[];


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

  var fontStyle = TextStyle(
    fontFamily: "OleoScript",
    fontSize: 30,
  );
  var fontStyle2 = TextStyle(
    fontFamily: "OleoScript",
    fontSize: 20,
  );
  int listQuestionNo=1;

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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Card(
                  margin: EdgeInsets.only(top: 40),
                  elevation: 4,
                  shape: CircleBorder(
                    side: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
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
                          Text("Right", style: fontStyle2),
                          Text("$right",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontFamily: "OleoScript",
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 8),
                  elevation: 4,
                  shape: CircleBorder(
                    side: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
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
                          style: fontStyle2,
                        ),
                        Text("$qestionNo", style: fontStyle2),
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.only(top: 40),
                  elevation: 4,
                  shape: CircleBorder(
                    side: BorderSide(
                      style: BorderStyle.none,
                    ),
                  ),
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
                            style: fontStyle2,
                          ),
                          Text("$wrong",
                              style: TextStyle(
                                  color: Colors.red,
                                  fontFamily: "OleoScript",
                                  fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            widget._index < widget.as.length
                ? Column(
                    children: <Widget>[
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        utf8.decode(
                            base64Decode(widget.as[widget._index]['question'])),
                        style: fontStyle,
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
                            style: fontStyle2,
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
                            style: fontStyle2,
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
                            style: fontStyle2,
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
                            style: fontStyle2,
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
                : Container(
                    child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          OutlineButton(borderSide: BorderSide(width: 1,color: Colors.black),
                              child: Text("Restert the Quiz"),
                              onPressed: _reset),
                          SizedBox(
                            width: 10,
                          ),
                          OutlineButton(
                              borderSide: BorderSide(width: 1,color: Colors.black),
                              child: Text("Reset the Quiz"),
                              onPressed: () {
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return App();
                                }));
                              }),
                        ],
                      ),
                      Container(
                      height: 400,
                        child: ListView.builder(
                            itemCount: widget.as.length,
                            itemBuilder: (context, indexx) {
                              return Column(
                                children: <Widget>[
                                  Text(
                                      "${listQuestionNo+indexx}. " "${utf8.decode(base64Decode(
                                          widget.as[indexx]['question']))} "

                                  ),
                                  rightWrong[indexx]== widget.as[indexx]['correct_answer']
                                  ?Icon(Icons.check):Icon(Icons.close),


                                  FittedBox(
                                    fit: BoxFit.fill,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        OutlineButton(
                                          onPressed: (){},
                                            child: Text(
                                          utf8.decode(base64Decode(widget
                                              .as[indexx]['correct_answer'])
                                          ),style: TextStyle(
                                              color: Colors.green
                                            ),
                                        ),
                              borderSide: BorderSide(
                              color: three,
                              width: 2.0,
                              style: BorderStyle.solid),
                                        ),
                                        OutlineButton(onPressed: (){},
                                            child: Text(utf8.decode(base64Decode(
                                                widget.as[indexx]
                                                        ['incorrect_answers']
                                                    [0])

                                            ),style: TextStyle(color: Colors.red),)
                                        , borderSide: BorderSide(
                                            color: three,
                                            width: 2.0,
                                            style: BorderStyle.solid),)
                                      ],
                                    ),
                                  ),

                                  FittedBox(
                                    fit: BoxFit.fill,
                                    child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[

                                        OutlineButton(
                                        onPressed: (){}, borderSide: BorderSide(
                                        color: three,
                                        width: 2.0,
                                        style: BorderStyle.solid),
                                          child:
                                          Text(utf8.decode(base64Decode(
                                              widget.as[indexx]['incorrect_answers'][1])
                              ),style: TextStyle(color: Colors.red),
                              )
                                        ),
                                        OutlineButton(onPressed: (){},
                                          child: Text(utf8.decode(base64Decode(
                                              widget.as[indexx]
                                                      ['incorrect_answers']
                                                  [2])),style: TextStyle(
                                            color: Colors.red
                                          ),), borderSide: BorderSide(
                                            color: three,
                                            width: 2.0,
                                            style: BorderStyle.solid),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            }),
                      ),
                    ],
                  )),
          ],
        ),
      ),
    );
  }
}
