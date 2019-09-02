import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;
import 'package:data_connection_checker/data_connection_checker.dart';

import './quiz.dart';
import './dilaog.dart';

main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

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
   int category;
   String difficulty;
  bool validator = false;
  int groupValue=0;
  GlobalKey<FormState> key = GlobalKey();
  static TextEditingController textControler = TextEditingController(text: "10");
  var categoryController=TextEditingController(text: "Any Value");
  var difficultyController=TextEditingController(text: "Any Value");


  Future<Map> getData() async {
    bool result = await DataConnectionChecker().hasConnection;
    if(result == true) {
      print('YAY! Free cute dog pics!');
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Center(child: CircularProgressIndicator());
          });

      amount=  int.parse(textControler.text);
      String url;
      if(category== null && difficulty ==null)
        {
         url= "https://opentdb.com/api.php?amount=$amount&type=multiple";
        }else if(difficulty==null){
        url =
        "https://opentdb.com/api.php?amount=$amount&category=$category&type=multiple";
      }else if(category ==null)
        {
         url= "https://opentdb.com/api.php?amount=$amount&difficulty=$difficulty&type=multiple";
        }else{
        url =
        "https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$difficulty&type=multiple";
      }

      print(url);
    final response = await http.get(url);
    var jsonData = json.decode(response.body);

//    String sf=base64Encode(response.body);
//   Uint8List byts=base64Decode(response.body);

//    var se=utf8.encode(response.body);
//    var sdf= utf8.decoder();
//    print(sdf);

    print(jsonData);
    as = jsonData['results'];
    print(as);
    print(as.length);

    return Navigator.push(context, MaterialPageRoute(builder: (context) {
      List buttons = [
        as[0]['correct_answer'],
        as[0]['incorrect_answers'][0],
        as[0]['incorrect_answers'][1],
        as[0]['incorrect_answers'][2],
      ];
      buttons.shuffle();
      return Quiz(as, buttons);
    }));
  }else {
      return showDialog(context: context,barrierDismissible: false,builder: (context){
        return AlertDialog(content: Text("NO Data Connecnton"),
        actions: <Widget>[
          OutlineButton(child: Text("Ok"),onPressed:(){
            Navigator.of(context).pop();
          } )
        ],);

      });
    }

  }

void onSubmit2(String result2){
  setState(() {
    difficulty = result2;
    switch(difficulty){
      case "8": difficultyController.text="any Dificulty";
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
        case 8: categoryController.text="Any Category";
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        drawer: Drawer( ),
        appBar: AppBar(

          backgroundColor: Colors.white,
             shape: CircleBorder(side: BorderSide(style:BorderStyle.none)),
          title: Text("Quiz App",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          //backgroundColor: Colors.white,
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

                        await getData();
                      }
                      else {
                        setState(() {
                          validator = true;
                        });
                      }},
                    child: Text("submit")),
            ],
          ),
        ));
  }
}
