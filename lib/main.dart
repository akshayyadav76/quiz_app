import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
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
  static int amount;
   int category = 8;
       String difficulty= "";


  Future<Map> getdata() async {
      amount=  int.parse(textControler.text);
      print("amount of lsit $amount");
      String url =
          "https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$difficulty&type=multiple";
      print(url);

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

 static TextEditingController textControler = TextEditingController(text: "10");
  var categoryController=TextEditingController(text: "Any Value");
  var difficultyController=TextEditingController(text: "Any Value");




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

void onSubmit2(String result2){
  setState(() {

    difficulty = result2;

    switch(difficulty){
      case "sd": difficultyController.text="any Dificulty";
      break;
      case "easy": difficultyController.text="Easy";
      break;
      case "medium": difficultyController.text="Medium";
      break;
      case "hard": difficultyController.text="Hard";
      break;
    }
  });

}

  void onSubmit(BuildContext context,int result) {
    setState(() {
      category=result;
           print("value of alert $category");
      switch(category){
        case 8: String url = "https://opentdb.com/api.php?amount=10";
        break;
        case 9:categoryController.text="General Knowledge";
        break;
        case 10:categoryController.text="Entertainment: Books";
        break;
        case 11:categoryController.text="Entertainment: Film";
        break;
        case 12:categoryController.text="Entertainment: Music";
        break;
        case 13:categoryController.text="Entertainment: Musicals & Theaters";
        break;
        case 14:categoryController.text="Entertainment: TeleVision";
        break;
        case 15:categoryController.text="Entertainment: Video Games";
        break;
        case 16:categoryController.text="Entertainment: Board Games";
        break;
        case 17:categoryController.text="Science: Nature";
        break;
        case 18:categoryController.text="Science: Computers";
        break;
        case 19:categoryController.text="Science: Mathematics";
        break;
        case 20:categoryController.text="Mythology";
        break;
        case 21:categoryController.text="Sports";
        break;
        case 22:categoryController.text="Geography";
        break;
        case 23:categoryController.text="History";
        break;
        case 24:categoryController.text="Politics";
        break;
        case 25:categoryController.text="Art";
        break;
        case 26:categoryController.text="Celebrities";
        break;
        case 27:categoryController.text="Animals";
        break;
        case 28:categoryController.text="Vehicles";
        break;
        case 29:categoryController.text="Entertainment: Comics";
        break;
        case 30:categoryController.text="Science: Gadgets";
        break;
        case 31:categoryController.text="Entertainment:Japanese Anime & Manga";
        break;
        case 32:categoryController.text="Entertainment: Cartoon & Animations";
        break;
      }
    });
  }


  @override
  void dispose() {
    textControler.clear();
    amount;
    super.dispose();
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

                 if (value.isEmpty || int.parse(value) > 50 || int.parse(value) < 1) {
                        return "Value must be less than or equal to 50";
                      }else{
                   return null;
                      }

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
                  padding: EdgeInsets.only(left: 29,right: 16,top: 8),
                  child: GestureDetector(
                    onTap:(){
                      showDialog(context: context,
                          builder: (context){
                            return Dilaog(onSubmit,category);
                          });
                    },
                    behavior:  HitTestBehavior.translucent,
                    child: TextFormField(
                     controller: categoryController,
                      enabled: false,
                      decoration: InputDecoration(
                      suffixIcon: IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: () {
                      }),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
               SizedBox(height: 20),
              Text("Select Difficulty"),
              Padding(
                padding: EdgeInsets.only(left: 29,right: 16,top: 8),
                child: GestureDetector(
                  onTap:(){
                    showDialog(context: context,
                        builder: (context){
                          return Dilog2(onSubmit2,difficulty);
                        });
                  },
                  behavior:  HitTestBehavior.translucent,
                  child: TextFormField(
                    controller: difficultyController,
                    enabled: false,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.arrow_drop_down),onPressed: () {
                      }),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),

            SizedBox(height: 20,),
            OutlineButton(
                    onPressed: () async {
                      if (key.currentState.validate()) {
                        showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return Center(child: CircularProgressIndicator());
                            });
                        await getdata();
                      } else {
                        setState(() {
                          validator = true;
                        });
                      }
                      //_onLoading(context);
                      //if(as == null){
                      // }
                      },
                    child: Text("submit")),


            ],
          ),
        ));
  }
}
