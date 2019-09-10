import 'package:flutter/material.dart';

class Rows extends StatelessWidget {

  int questionNo;
  int  right;
  int  wrong;

  Rows(this.questionNo,this.right,this.wrong);
  var boderNone=CircleBorder(side: BorderSide(style: BorderStyle.none,));


  @override
  Widget build(BuildContext context) {

    return  LayoutBuilder(

      builder: (context,constrains){
        return   Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              margin: EdgeInsets.only(top: 40,),
              elevation: 4,
              shape: boderNone,
              child: Container(
                height: constrains.maxHeight *0.5,
                width: constrains.maxWidth *0.16,
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
              margin: EdgeInsets.only(bottom: 10),
              elevation: 4,
              shape: boderNone,
              child: Container(
                height: constrains.maxHeight *0.8,
                width: constrains.maxWidth *0.28,
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
                height: constrains.maxHeight *0.5,
                width: constrains.maxWidth *0.16,
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
      },

    );
  }
}
