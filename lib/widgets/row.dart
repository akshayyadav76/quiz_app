import 'package:flutter/material.dart';

class Rows extends StatelessWidget {

  int questionNo;
  int  right;
  int  wrong;

  Rows(this.questionNo,this.right,this.wrong);
  var boderNone=CircleBorder(side: BorderSide(style: BorderStyle.none,));


  @override
  Widget build(BuildContext context) {

    return  Row(
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
                Text("$questionNo", style:  Theme.of(context).textTheme.headline,),
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
    );
  }
}
