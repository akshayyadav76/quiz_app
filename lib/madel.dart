import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Madel extends StatefulWidget {

  final int asLength;
  final int right;

  Madel(this.asLength, this.right);

  @override
  _MadelState createState() => _MadelState();
}

class _MadelState extends State<Madel> {

  String madelIcon;
  String madelName;

  @override
  void initState() {
    int one = widget.asLength % 40;
    int two = widget.asLength % 70;
    int three = widget.asLength % 100;

    if (widget.right < one) {
      madelIcon = "assets/madel_icons/bronze.png";
      madelName = "Bronze Madel";
    }
    if (widget.right < two && widget.right > one) {
      madelIcon = "assets/madel_icons/silver.png";
      madelName = "Silver Madel";
    }
    if (widget.right < three && widget.right > two) {
      madelIcon = "assets/madel_icons/gold.png";
      madelName = "Gold Madel";
    }

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constrins) {
      return Column(
        children: <Widget>[
          Card(
              shape: CircleBorder(),
              child:
              Image.asset(
                madelIcon,
                height:  constrins.maxHeight *0.8,
              )
          ),
          Text(madelName, style: Theme
              .of(context)
              .textTheme
              .title,),
        ],
      );
    });
  }
}
