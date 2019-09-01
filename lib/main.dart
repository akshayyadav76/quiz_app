import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as http;
import 'package:http/http.dart' as http;

import './quiz.dart';
import './dilaog.dart';

main() {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.white
        // primarySwatch: Colors.lightGreen
        ),
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Map jsonData;
  List as;
  int seconds = 3;
  int Category =9;

  Future<Map> getdata() async {
    String url =
        "https://opentdb.com/api.php?amount=10&category=$Category&difficulty=easy&type=multiple";
    final response = await http.get(url);
    var jsonData = json.decode(response.body);
    print(jsonData);
    as = jsonData['results'];
    print(as);
    print(as.length);

    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      List buttons = [
        as[0]['correct_answer'],
        //widget._questions[widget._index]["Answers"][0]["Score"],

        as[0]['incorrect_answers'][0],
        //widget._questions[widget._index]["Answers"][1]["Score"],

        as[0]['incorrect_answers'][1],
        // widget._questions[widget._index]["Answers"][2]["Score"],

        as[0]['incorrect_answers'][2],
        // widget._questions[widget._index]["Answers"][3]["Score"],
      ];
      buttons.shuffle();
      return Quiz(as, buttons);
    }));
  }

//   _onLoading(BuildContext context) {
////    showDialog(
////      context: context,
////      barrierDismissible: false,
////      builder: (context){
//        print(as);
//      //  if(as ==null){
//        showDialog(context: context ,barrierDismissible:  false,
//        builder: (context){
//          return
//            Center(child: CircularProgressIndicator());
//        });
//        //}
////        else{
////
////         // Navigator.of(context).pop();
////
////        Navigator.push(context, MaterialPageRoute(builder: (context){
////          List buttons =[
////            as[0]['correct_answer'],
////            //widget._questions[widget._index]["Answers"][0]["Score"],
////
////            as[0]['incorrect_answers'][0],
////            //widget._questions[widget._index]["Answers"][1]["Score"],
////
////            as[0]['incorrect_answers'][1],
////            // widget._questions[widget._index]["Answers"][2]["Score"],
////
////            as[0]['incorrect_answers'][2],
////            // widget._questions[widget._index]["Answers"][3]["Score"],
////
////          ];
////          buttons.shuffle();
////
////          return Quiz(as,buttons);
////        }));
////
////        }
//
//
////          Dialog(
////          child: new Row(
////            mainAxisSize: MainAxisSize.min,
////            children: [
////               CircularProgressIndicator(),
////              Text("time left $seconds"),
////            ],
////          ),
////        );
////      },
////    );
////    new Future.delayed(new Duration(seconds: seconds), () {
////
////      Navigator.push(context, MaterialPageRoute(builder: (context){
////       List buttons =[
////          as[0]['correct_answer'],
////          //widget._questions[widget._index]["Answers"][0]["Score"],
////
////          as[0]['incorrect_answers'][0],
////          //widget._questions[widget._index]["Answers"][1]["Score"],
////
////          as[0]['incorrect_answers'][1],
////          // widget._questions[widget._index]["Answers"][2]["Score"],
////
////          as[0]['incorrect_answers'][2],
////          // widget._questions[widget._index]["Answers"][3]["Score"],
////
////        ];
////        buttons.shuffle();
////
////        return Quiz(as,buttons);
////      }));
//
//
//     }

  TextEditingController textControler = TextEditingController(text: "10");

  checkText(String value) {
    int convertInt = int.parse(value);
    print(value);

    if (convertInt < 50) {
      return "Wrong value";
    }
    return null;
  }

  bool validator = false;
  GlobalKey<FormState> key = GlobalKey();


   int groupValue=0;




//  void show(){
//    var alert=
//
//    showDialog(context: context,
//        builder: (context){
//          return alert;
//        });
//  }

  void onSubmit(int result) {
    setState(() {
      Category=result;
    });
  }

  @override
  Widget build(BuildContext context) {
     print(groupValue);
    return Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColorLight,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Text("Number of Questions"),
              SizedBox(
                height: 6,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 27,
                  right: 14,
                ),
                child: Form(
                  key: key,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    controller: textControler,
                    autovalidate: validator,
                    maxLength: 2,
                    validator: (String value) {
                      // print(int.parse(vlaue));
                      if (value.isEmpty ||
                          int.parse(value) > 50 ||
                          int.parse(value) < 1) {
                        return "Value must be less than or equal to 50";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      //errorText: checkText(textControler.text),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
              Text("Select Category"),
               Padding(
                  padding: EdgeInsets.only(left: 29,right: 16),
                  child: GestureDetector(
                    onTap:(){
                      showDialog(context: context,
                          builder: (context){
                            return Dilaog(onSubmit);
                          });
                    },
                    behavior:  HitTestBehavior.translucent,
                    child: TextFormField(
                      initialValue: "any value",
                      enabled: false,
                      decoration: InputDecoration(
                      suffixIcon: IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: () {
                        print("sseee");
                      }),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),


              FlatButton(
                  onPressed: () async {
                    if (key.currentState.validate()) {
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Center(child: CircularProgressIndicator());
                          });
                    } else {
                      setState(() {
                        validator = true;
                      });
                    }
                    //_onLoading(context);
                    //if(as == null){

                    await getdata();
                    // }
                  },
                  child: Text("submit")),

            ],
          ),
        ));
  }
}
