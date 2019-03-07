import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;
import 'package:tweenstalent/pages/login.dart';
import 'package:tweenstalent/pages/register.dart';
import 'package:tweenstalent/components/dots.dart';
import 'package:tweenstalent/components/superpower.dart';
import 'package:auto_size_text/auto_size_text.dart';

class QuestionPage extends StatefulWidget {
  Widget title;
  Image image;
  QuestionPage({Key key, @required this.title, @required this.image})
      : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  int selected = 2, question = 0, max = 4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Material(
            child: new SingleChildScrollView(
      child: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("assets/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: new Stack(children: <Widget>[
            new Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: new Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                        padding: EdgeInsets.only(top: 30),
                        height: MediaQuery.of(context).size.height / 4,
                        child: widget.image),
                    new SizedBox(
                      height: 20.0,
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: new Row(
                        children: <Widget>[
                          new Flexible(
                              child: new Container(
                                  padding: EdgeInsets.all(5.0),
                                  color: utils.HexColor("#20202D"),
                                  child: new RichText(
                                    text: TextSpan(
                                      text: (question+1).toString(),
                                      style: TextStyle(color: utils.colorLogo1),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: ' van 5',
                                            style: TextStyle(
                                                color: Colors.white)),
                                      ],
                                    ),
                                  ))),
                        ],
                      ),
                    ),
                    new Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: widget.title),
                    new SizedBox(
                      height: 10.0,
                    ),
                    new Container(
                        width: MediaQuery.of(context).size.width / 1.3,
                        child: new Text(
                          "Ik kan veel vreemde vogels en planten benoemen.",
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                        )),
                    new SizedBox(
                      height: 40.0,
                    ),
                    new Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: new Column(
                        children: <Widget>[
                          new MaterialButton(
                            color:
                                selected == 1 ? utils.colorLogo1 : Colors.white,
                            height: 50,
                            highlightColor: utils.colorLogo1,
                            minWidth: MediaQuery.of(context).size.width / 1.3,
                            child: new Text(
                              "Ja",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              setState(() {
                                if (selected == 1) {
                                  selected = 2;
                                } else {
                                  selected = 1;
                                }
                              });
                            },
                          ),
                          new SizedBox(
                            height: 30.0,
                          ),
                          new MaterialButton(
                            color:
                                selected == 0 ? utils.colorLogo1 : Colors.white,
                            height: 50,
                            highlightColor: utils.colorLogo1,
                            minWidth: MediaQuery.of(context).size.width / 1.3,
                            child: new Text(
                              "Nee",
                              style: TextStyle(fontSize: 20.0),
                            ),
                            onPressed: () {
                              setState(() {
                                if (selected == 0) {
                                  selected = 2;
                                } else {
                                  selected = 0;
                                }
                              });
                            },
                          )
                        ],
                      ),
                    ),
                    new Expanded(
                        child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        new Container(
                          width: MediaQuery.of(context).size.width / 6,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: utils.HexColor("#AA1741"),
                              offset: Offset(0.0, 1.5),
                              blurRadius: 20.0,
                            ),
                          ]),
                          child: new FloatingActionButton(
                            heroTag: "Home",
                            child: question != 0 ? new Icon(Icons.arrow_back_ios) : new Icon(Icons.home),
                            onPressed: () {
                              if(question != 0) {
                                setState(() {
                                  question--;
                                });
                              } else {
                                Navigator.pop(context);
                              }
                            },
                          ),
                          margin: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width / 6,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: selected != 2
                                  ? utils.HexColor("#AA1741")
                                  : utils.HexColor("#AA1741").withOpacity(0.1),
                              offset: Offset(0.0, 1.5),
                              blurRadius: 20.0,
                            ),
                          ]),
                          child: new FloatingActionButton(
                            backgroundColor: selected != 2
                                ? Colors.pink
                                : Colors.pink.withOpacity(0.1),
                            heroTag: "Forward",
                            child: question != max ? new Icon(Icons.arrow_forward_ios) : new Icon(Icons.check),
                            onPressed: selected != 2
                                ? () {
                                    setState(() {
                                      if(question != max) {
                                        question++;
                                        selected = 2;
                                      } else {
                                        Navigator.pop(context, true);
                                      }
                                    });
                                  }
                                : null,
                          ),
                          margin: new EdgeInsets.only(top: 20.0, bottom: 20.0),
                        ),
                      ],
                    ))
                  ],
                )),
          ])),
    )));
  }
}
