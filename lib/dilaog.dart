import 'package:flutter/material.dart';



typedef void MyFormCallback(int result);
class Dilaog extends StatefulWidget {

  final MyFormCallback onSubmit;
  Dilaog(this.onSubmit);

  @override
  _DilaogState createState() => _DilaogState();
}

class _DilaogState extends State<Dilaog> {

  int groupValue=8;

  void radioOnTap(int value){
    setState(() {
      groupValue = value;
        Navigator.pop(context);
        widget.onSubmit(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top:57,left: 5,right: 5),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Any Category"),
              trailing: Radio<int>(value: 8, groupValue: groupValue, onChanged: radioOnTap),
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
              title: Text("Entertainment: Board Games"),
              trailing: Radio<int>(value: 16, groupValue: groupValue, onChanged: radioOnTap),
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
            ListTile(
              title: Text("Entertainment: Comics"),
              trailing: Radio<int>(value: 29, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Science: Gadgets"),
              trailing: Radio<int>(value: 30, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment:Japanese Anime & Manga"),
              trailing: Radio<int>(value: 31, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
            ListTile(
              title: Text("Entertainment: Cartoon & Animations"),
              trailing: Radio<int>(value: 32, groupValue: groupValue, onChanged: radioOnTap),
            ),Divider(),
          ],
        ),
      ),
    );
  }
}
