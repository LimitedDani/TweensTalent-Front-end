import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tweenstalent/components/scoreDots.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:tweenstalent/utils.dart' as utils;
class Result extends StatefulWidget {
  Result();

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return                     new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text("Zelftalent", style: TextStyle(color: Colors.white,)),
            scoreDots(score: 6),
          ],
        ),
        new SizedBox(
          height: 10,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text("Taaltalent", style: TextStyle(color: Colors.white),),
            scoreDots(score: 3),
          ],
        ),
        new SizedBox(
          height: 10,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text("Menstalent", style: TextStyle(color: Colors.white),),
            scoreDots(score: 7),
          ],
        ),
        new SizedBox(
          height: 10,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text("Beeldtalent", style: TextStyle(color: Colors.white),),
            scoreDots(score: 10),
          ],
        ),
        new SizedBox(
          height: 10,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text("Rekentalent", style: TextStyle(color: Colors.white),),
            scoreDots(score: 5),
          ],
        ),
        new SizedBox(
          height: 10,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text("Natuurtalent", style: TextStyle(color: Colors.white),),
            scoreDots(score: 8),
          ],
        ),
        new SizedBox(
          height: 10,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text("Beweegtalent", style: TextStyle(color: Colors.white),),
            scoreDots(score: 7),
          ],
        ),
        new SizedBox(
          height: 10,
        ),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            new Text("Muzikaaltalent", style: TextStyle(color: Colors.white),),
            scoreDots(score: 5),
          ],
        ),
        new SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
