import 'dart:convert';

import 'package:flutter/material.dart';
import './widgets/ap_bar.dart';

class Solutions extends StatelessWidget {
  List as;
  int listQuestionNo=1;
  List<String>rightWrong;
  var lastButtonsBorder;
  Solutions(this.as,this.rightWrong,this.lastButtonsBorder);



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height*0.18,
                child: ApBar("Solutions")
            
            ),

            Container(
              height: MediaQuery.of(context).size.height*0.82,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: 40,left: 5),
                  itemCount: as.length,
                  itemBuilder: (context, indexx) {
                    return Column(
                      children: <Widget>[
                        Text(
                          " ${listQuestionNo+indexx}. " "${utf8.decode(base64Decode(
                              as[indexx]['question']))} ",style:Theme.of(context).textTheme.title,
                        ),
                        rightWrong[indexx]== as[indexx]['correct_answer']
                            ?Icon(Icons.check):Icon(Icons.close),
                        FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              OutlineButton(
                                onPressed: (){},
                                child: Text(
                                  utf8.decode(base64Decode(as[indexx]['correct_answer'])
                                  ),style: Theme.of(context).textTheme.subtitle,
                                ),
                                borderSide: lastButtonsBorder,
                              ),
                              OutlineButton(onPressed: (){},
                                child: Text(utf8.decode(base64Decode(
                                    as[indexx]
                                    ['incorrect_answers']
                                    [0])

                                ),style: Theme.of(context).textTheme.button),
                                borderSide:lastButtonsBorder,
                              )
                            ],
                          ),
                        ),

                        FittedBox(
                          fit: BoxFit.fill,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              OutlineButton(
                                  onPressed: (){},
                                  borderSide: lastButtonsBorder,
                                  child:
                                  Text(utf8.decode(base64Decode(
                                      as[indexx]['incorrect_answers'][1])
                                  ),style: Theme.of(context).textTheme.button,
                                  )
                              ),
                              OutlineButton(onPressed: (){},
                                child: Text(utf8.decode(base64Decode(
                                    as[indexx]
                                    ['incorrect_answers']
                                    [2])),style: Theme.of(context).textTheme.button,),
                                borderSide:lastButtonsBorder,
                              )
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
            ),

          ],



        ),

    );
  }
}
