import 'package:flutter/material.dart';
import 'Constants.dart';

class leftimageCard extends StatelessWidget {
  leftimageCard({
    @required this.titlecolour,
    @required this.subtitlecolour,
    @required this.cardChild,
    @required this.title,
    @required this.subtitle,
    @required this.text,
  });
  final Color? titlecolour;
  final Color? subtitlecolour;

  final Widget? cardChild;
  final String? text;
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: cardChild,
          height: 200.0,
          width: 170.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
        ),
        Padding(
            padding: EdgeInsets.only(
              left: 20.0,
            ),
            child: Column(
              children: <Widget>[
                Container(
                  width: 160.0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 30.0),
                    child: Text(
                      title!,
                      style: TextStyle(
                          color: titlecolour,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 3.0,
                ),
                Container(
                  width: 160.0,
                  child: Text(
                    subtitle!,
                    style: TextStyle(color: subtitlecolour, fontSize: 12.0),
                    textAlign: TextAlign.end,
                  ),
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 12.0,
                ),
                Container(
                  width: 160.0,
                  height: 190.0,
                  child: Text(
                    text!,
                    style: TextStyle(
                        fontSize: 10.0,
                        fontFamily: "Helvetica",
                        height: 1.5,
                        color: Colors.black),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ))
      ],
    );
  }
}
