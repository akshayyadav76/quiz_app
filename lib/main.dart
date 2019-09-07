import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share/share.dart';
import 'package:flutter/services.dart';


import './quiz.dart';
import './dilaog.dart';



main() {

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
   // systemNavigationBarColor: Colors.blue, // navigation bar color
    statusBarColor: Colors.black, // status bar color
  ));

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,

 theme: ThemeData(
      primaryColor: Colors.white,
  accentColor: Colors.black,
    fontFamily: "OleoScript",
    iconTheme: IconThemeData(size: 28),
   textTheme: TextTheme(subtitle: TextStyle(fontSize: 20,color:Colors.green),
       button:TextStyle(fontSize: 20,color:Colors.red) ),
 ),
    home: App(
    ),
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
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();






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
         url= "https://opentdb.com/api.php?amount=$amount&type=multiple&encode=base64";
        }else if(difficulty==null){
        url =
        "https://opentdb.com/api.php?amount=$amount&category=$category&type=multiple&encode=base64";
      }else if(category ==null)
        {
         url= "https://opentdb.com/api.php?amount=$amount&difficulty=$difficulty&type=multiple&encode=base64";
        }else{
        url =
        "https://opentdb.com/api.php?amount=$amount&category=$category&difficulty=$difficulty&type=multiple&encode=base64";
      }

      print(url);
    final response = await http.get(url);
    var jsonData = json.decode(response.body);

    as = jsonData['results'];
    print("as data form main $as                  ");
    print("as length form main ${as.length}             ");

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
        return AlertDialog(content: Text("No Data Connecnton avalible"),
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

  void dv(){
    setState(() {
      _scaffoldKey.currentState.openDrawer();
    });
  }








  @override
  Widget build(BuildContext context){

    return Scaffold(

      drawer: Drawer(
        child: Column(
          children: <Widget>[
         Container(
           margin: EdgeInsets.only(top: 50),
           child: Text("Quiz App",style: TextStyle(fontSize: 40)),
         ),
          Divider(),

         ListTile(title: Text("Source Code",style: Theme.of(context).textTheme.title,),
             trailing: IconTheme(data: Theme.of(context).iconTheme, child: Icon(Icons.code)),
         onTap: () {
           launch("https://github.com/akshayyadav76/quiz_app");
         }
         ),
          ListTile(title: Text("More Apps On Google Play",
            style: Theme.of(context).textTheme.title,),
            trailing: IconTheme(data: Theme.of(context).iconTheme, child: Icon(Icons.file_download)),
            onTap: (){
            launch("https://play.google.com/store/apps/developer?id=Akshay+yadav&hl=en");
            },),
          
          ListTile(title: Text("Share the App",style: Theme.of(context).textTheme.title,),
            trailing: IconTheme(data: Theme.of(context).iconTheme, child: Icon(Icons.share)),
          onTap: (){
            Share.share("Test your knowledge and get knowledge of the world with this beautiful Quiz App\n"
               "Link-: https://play.google.com/store/apps/developer?id=Akshay+yadav&hl=en ",);
          },),
            ListTile(title: Text("Rate on Google play",style: Theme.of(context).textTheme.title,),
              trailing: IconTheme(data: Theme.of(context).iconTheme, child: Icon(Icons.next_week)),
              onTap: (){
                launch("https://play.google.com/store/apps/developer?id=Akshay+yadav&hl=en");
              },),
            ListTile(title: Text("About",style: Theme.of(context).textTheme.title),
              trailing: IconTheme(data: Theme.of(context).iconTheme, child: Icon(Icons.error)),
            onTap: (){
              showDialog(context:context,builder:(context){
                return AlertDialog(title: Text("About"),content: Text("This is the full fledged sample app of flutter framework "
                    "if you like it you can check the source code on github fork and start it..enjoy the app "
                ),);
              });
            },),

        ],
        ),
      ),
      key: _scaffoldKey,
        backgroundColor: Theme.of(context).primaryColor,
        body:SingleChildScrollView(
          child: Column(
            children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height*0.2,
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(padding: EdgeInsets.only(top: 15,left: 5),
                      icon: Icon(Icons.dehaze), onPressed: dv
                  ),
                  Card(
                    elevation: 3,
                    shape: CircleBorder(side: BorderSide(style:BorderStyle.none,),),
                    child: Container(
                      height: 80,
                      width: 100,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 10),
                      child: Text("Quiz App",style: Theme.of(context).textTheme.headline,),
                    ),
                  ),

                  Container(
                    //color: Colors.red,
                    height: 70,
                    width: 60,
                  ),
                ],),
            ),

              Container(
                height: MediaQuery.of(context).size.height*0.8,
                child: Column(

                children: <Widget>[


                  SizedBox(
                    height: 30,
                  ),
                  Text("Number of Questions", style: Theme.of(context).textTheme.headline,
                  ),
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
                      child: Container(
                        height: 70,
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
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(width: 1,color: Colors.black),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              borderSide: BorderSide(width: 1,color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),


                  Text("Select Category",style: Theme.of(context).textTheme.headline,),
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
                      child: OutlineButton(
                        disabledBorderColor: Colors.black,
                        child: TextFormField(
                          controller: categoryController,
                          enabled: false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(icon: Icon(Icons.arrow_drop_down),onPressed: () {
                            }),
                            //border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Select Difficulty",style: Theme.of(context).textTheme.headline,),

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
                      child: OutlineButton(
                        disabledBorderColor: Colors.black,
                        child: TextFormField(
                          controller: difficultyController,
                          enabled: false,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(Icons.arrow_drop_down),onPressed: () {
                            }),
                          ),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20,),

                  OutlineButton(
                      borderSide: BorderSide(width: 1),
                      color: Colors.white,
                      onPressed: () async {
                        if (key.currentState.validate()) {

                          await getData();
                        }
                        else {
                          setState(() {
                            validator = true;
                          });
                        }},
                      child: Text("submit",style: Theme.of(context).textTheme.headline,)),



                ],
              ),)







            ],
          ),
        ));
  }
}
