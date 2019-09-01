import 'package:flutter/material.dart';



typedef void MyFormCallback(int result);
class Dilaog extends StatefulWidget {

  final MyFormCallback onSubmit;
  Dilaog(this.onSubmit);

  @override
  _DilaogState createState() => _DilaogState();
}

class _DilaogState extends State<Dilaog> {

  int groupValue;

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
      padding: EdgeInsets.only(top:10),
      child: Card(
        child: Column(
          children: <Widget>[
            ListTile(
              title: Text("Any Category"),
              trailing: Radio<int>(value: 9, groupValue: groupValue, onChanged: radioOnTap),

            ),
            ListTile(
              title: Text("Any Category"),
              trailing: Radio<int>(value: 10, groupValue: groupValue, onChanged: radioOnTap),

            ),
            ListTile(
              title: Text("Any Category"),
              trailing: Radio<int>(value: 11, groupValue: groupValue, onChanged: radioOnTap),

            ),

          ],
        ),
      ),
    );
  }
}
