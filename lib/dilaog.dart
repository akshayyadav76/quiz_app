import 'package:flutter/material.dart';



typedef void MyFormCallback(BuildContext context,int result);

class Dilaog extends StatefulWidget {

  final MyFormCallback onSubmit;
  int category;
  Dilaog(this.onSubmit,this.category);

  @override
  _DilaogState createState() => _DilaogState();
}

class _DilaogState extends State<Dilaog> {

      int groupValue;
 @override
  void initState() {
   groupValue = widget.category;
    super.initState();
  }

  void radioOnTap(int value){
    setState(() {
        Navigator.pop(context);
        widget.onSubmit(context,value);
        print(groupValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupValue);
    return SingleChildScrollView(
      padding: EdgeInsets.only(top:57,left: 5,right: 5),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Any Category"),
              trailing: Radio<int>(value: null, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("General Knowledge"),
              trailing: Radio<int>(value: 9, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: Books"),
              trailing: Radio<int>(value: 10, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: Film"),
              trailing: Radio<int>(value: 11, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: Music"),
              trailing: Radio<int>(value: 12, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: Musicals & Theaters"),
              trailing: Radio<int>(value: 13, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: TeleVision"),
              trailing: Radio<int>(value: 14, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: Video Games"),
              trailing: Radio<int>(value: 15, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment:Japanese Anime & Manga"),
              trailing: Radio<int>(value: 31, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: Cartoon & Animations"),
              trailing: Radio<int>(value: 32, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: Board Games"),
              trailing: Radio<int>(value: 16, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: Comics"),
              trailing: Radio<int>(value: 29, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Science: Nature"),
              trailing: Radio<int>(value: 17, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Science: Computers "),
              trailing: Radio<int>(value: 18, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Science: Gadgets"),
              trailing: Radio<int>(value: 30, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Science: Mathematics"),
              trailing: Radio<int>(value: 19, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Mythology"),
              trailing: Radio<int>(value: 20, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Sports"),
              trailing: Radio<int>(value: 21, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Geography"),
              trailing: Radio<int>(value: 22, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("History"),
              trailing: Radio<int>(value: 23, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Politics"),
              trailing: Radio<int>(value: 24, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Art"),
              trailing: Radio<int>(value: 25, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Celebrities"),
              trailing: Radio<int>(value: 26, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Animals"),
              trailing: Radio<int>(value: 27, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Vehicles"),
              trailing: Radio<int>(value: 28, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
          ],
        ),
      ),
    );
  }
}


typedef void MyFormCallback2(String result2);

class Dilog2 extends StatefulWidget {

  final MyFormCallback2 onSubmit2;
  String difficulty;
  Dilog2(this.onSubmit2,this.difficulty);

  @override
  _Dilog2State createState() => _Dilog2State();
}

class _Dilog2State extends State<Dilog2> {

  String groupValue;

  @override
  void initState() {
    groupValue = widget.difficulty;
    super.initState();
  }

  void radioOnTap(String value){
    setState(() {

      Navigator.pop(context);
      widget.onSubmit2(value);
      print(groupValue);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Card(
       margin: EdgeInsets.only(top: 130,bottom: 126),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              title: Text("Any Difficulty"),
              trailing: Radio<String>(value: "8", groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Esay"),
              trailing: Radio<String>(value: "easy", groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Medium"),
              trailing: Radio<String>(value: "medium", groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Hard"),
              trailing: Radio<String>(value: "hard", groupValue: groupValue, onChanged: radioOnTap),
            ),
          ],
        ),

    );
  }
}

