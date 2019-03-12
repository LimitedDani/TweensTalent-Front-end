import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tweenstalent/utils.dart' as utils;
class scoreDots extends StatefulWidget {
  int score;
  scoreDots(
      {@required this.score});

  @override
  _scoreDotsState createState() => _scoreDotsState();
}

class _scoreDotsState extends State<scoreDots> {
  Color color;
  int width = 25;
  int height = 60;

  @override
  void initState() {
    if(widget.score <= 5) {
      color = utils.HexColor("#FF004A");
    } else if(widget.score > 5 && widget.score < 8) {
      color = utils.HexColor("#FF9133");
    } else if(widget.score >= 8 && widget.score <= 10) {
      color = utils.HexColor("#1EDE81");
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Container(
          margin: EdgeInsets.only(left: 5, right: 5),
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 1 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 2 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 3 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 4 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 5 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 6 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 7 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 8 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        ),
        new Container(
          margin: EdgeInsets.only(right: 5),
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 9 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        ),
        new Container(
          width: MediaQuery.of(context).size.width / width,
          height: MediaQuery.of(context).size.height / height,
          decoration: new BoxDecoration(
            color: 10 <= widget.score ? color : utils.HexColor("#38384F"),
            borderRadius: new BorderRadius.all(Radius.circular(2)),
          ),
        )
      ],
    );
  }
}
