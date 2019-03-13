import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;
import 'package:tweenstalent/pages/login.dart';
import 'package:tweenstalent/pages/register.dart';
import 'package:tweenstalent/components/scrollBar.dart';
import 'package:tweenstalent/components/result.dart';
import 'package:tweenstalent/overlay/customOverlaySmall.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tweenstalent/enum/SuperPower.dart';
import 'package:auto_size_text/auto_size_text.dart';

class OccupationalProfilePage extends StatefulWidget {
  OccupationalProfilePage({Key key}) : super(key: key);

  @override
  _OccupationalProfilePageState createState() =>
      _OccupationalProfilePageState();
}

class _OccupationalProfilePageState extends State<OccupationalProfilePage> {
  @override
  void initState() {
    super.initState();
  }

  double one = 0.25;
  double two = 0.25;
  double three = 0.25;

  List<String> beroepen = [
    'Dierenverzorger',
    'Dierenarts',
    'Bloemist',
    'Laborant',
    'Voetbaltrainer'
  ];
  int enabled = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Material(
            child: new ScrollbarCustom(
      child: new SingleChildScrollView(
          child: new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(
                  image: new AssetImage("assets/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: new Stack(children: <Widget>[
                new Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: new Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Expanded(
                          flex: 2,
                          child: new Container(
                            width: MediaQuery.of(context).size.width,
                            child: new Center(
                              child: new Text(
                                "Beroepenprofiel"?.toUpperCase(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 30.0),
                              ),
                            ),
                          ),
                        ),
                        new Expanded(
                          flex: 1,
                          child: new Container(
                            width: MediaQuery.of(context).size.width,
                            child: new Text(
                              "Ontdek de bijbehorende beroepen",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0),
                            ),
                          ),
                        ),
                        new Expanded(
                          flex: 4,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    one = one == 0.25 ? 1.0 : 0.25;
                                    two = 0.25;
                                    three = 0.25;
                                  });
                                },
                                child: new Container(
                                  margin: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: new Column(
                                    children: <Widget>[
                                      new Opacity(
                                        opacity: one,
                                        child: new Image(
                                          image:
                                              AssetImage("assets/purple.png"),
                                          fit: BoxFit.contain,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              7,
                                        ),
                                      ),
                                      new AutoSizeText(
                                        "Beeldtalent",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(one)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    one = 0.25;
                                    two = two == 0.25 ? 1.0 : 0.25;
                                    three = 0.25;
                                  });
                                },
                                child: new Container(
                                  margin: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: new Column(
                                    children: <Widget>[
                                      new Opacity(
                                        opacity: two,
                                        child: new Image(
                                          image: AssetImage("assets/green.png"),
                                          fit: BoxFit.contain,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              7,
                                        ),
                                      ),
                                      new AutoSizeText(
                                        "Natuurtalent",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(two)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              new GestureDetector(
                                onTap: () {
                                  setState(() {
                                    one = 0.25;
                                    two = 0.25;
                                    three = three == 0.25 ? 1.0 : 0.25;
                                  });
                                },
                                child: new Container(
                                  margin: EdgeInsets.all(10),
                                  width: MediaQuery.of(context).size.width / 4,
                                  child: new Column(
                                    children: <Widget>[
                                      new Opacity(
                                        opacity: three,
                                        child: new Image(
                                          image:
                                              AssetImage("assets/yellow.png"),
                                          fit: BoxFit.contain,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              7,
                                        ),
                                      ),
                                      new AutoSizeText(
                                        "Beweegtalent",
                                        maxLines: 1,
                                        style: TextStyle(
                                            color: Colors.white
                                                .withOpacity(three)),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Expanded(
                            flex: 12,
                            child: new Column(
                              children: <Widget>[
                                new Expanded(
                                    flex: 1,
                                    child: new Container(
                                      color: utils.HexColor("#252737"),
                                      child: ListView.builder(
                                          itemCount: beroepen.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            return new GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    enabled = index;
                                                  });
                                                },
                                                child: new Container(
                                                    margin: EdgeInsets.only(
                                                        left: 20, right: 20),
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                        border: Border(
                                                            bottom: BorderSide(
                                                                color: enabled ==
                                                                        index
                                                                    ? utils
                                                                        .colorLogo1
                                                                    : Colors
                                                                        .white,
                                                                width: 2.0))),
                                                    child: new Row(
                                                      children: <Widget>[
                                                        new Text(
                                                          beroepen[index],
                                                          style: TextStyle(
                                                              color: enabled ==
                                                                      index
                                                                  ? utils
                                                                      .colorLogo1
                                                                  : Colors
                                                                      .white),
                                                        )
                                                      ],
                                                    )));
                                          }),
                                    )),
                                new Expanded(
                                    flex: 4,
                                    child: new Container(
                                        color: utils.HexColor("#20202D"),
                                        child: new ListView(
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: <Widget>[
                                                new Container(
                                                  margin: EdgeInsets.all(20.0),
                                                  child: new Text(
                                                    "Voetbaltrainer"
                                                        ?.toUpperCase(),
                                                    style: TextStyle(
                                                        color: Colors.white, fontSize: 20.0),
                                                  ),
                                                ),
                                                new Container(
                                                  margin: EdgeInsets.all(20.0),
                                                  child: new Text(
                                                    "Een Voetbaltrainer (Trainer Betaald Voetbal of Coach Betaald Voetbal) traint en coacht een of meerdere voetbalteams. Men kan dit beroep op vrijwillige basis uitoefenen, bijv. als jeugdtrainer bij amateurverenigingen maar ook betaald als Hoofdtrainer (Trainer van het 1e elftal) en zelfs goed betaald als Coach in het betaald voetbal (van hoofdklasse amateurs tot en met eredivisieniveau). In de basis ben je verantwoordelijk voor een elftal voetballers waar je elke week een aantal trainingen mee afwerkt ter voorbereiding op een wedstrijd die meestal in het weekend plaatsvindt. Maar Voetbaltrainger ben je ook om zowel je elftal als individuele spelers beter te laten voetballen. Je brengt ze zowel op tactisch, mentaal, fysiek en technisch vlak als in teamwork zoveel mogelijk bij. Tevens ben je eindverantwoordelijk voor de wedstrijdtactiek, opstellingen en uiteindelijk ook de resultaten die je elftal behaalt. Vanuit het MBO (CIOS) zijn er een aantal opleidingstrajecten die je tot trainer/coach opleiden voor sport en beweging. Trainer/Coach is een van de uitstroomrichtingen van de opleiding Sport- en Bewegingscoördinator.",
                                                    style: TextStyle(
                                                      color: Colors.white, fontSize: 20.0),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ))),
                                new Expanded(
                                    flex: 2,
                                    child: new Container(
                                      color: utils.HexColor("#20202D"),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                7,
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color:
                                                    utils.HexColor("#AA1741"),
                                                offset: Offset(0.0, 1.5),
                                                blurRadius: 20.0,
                                              ),
                                            ]),
                                            child: new FloatingActionButton(
                                              heroTag: "Home",
                                              child: new Icon(
                                                  Icons.arrow_back_ios),
                                              onPressed: () {},
                                            ),
                                            margin: new EdgeInsets.only(
                                                top: 20.0, bottom: 20.0),
                                          ),
                                          new Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                7,
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color:
                                                    utils.HexColor("#AA1741"),
                                                offset: Offset(0.0, 1.5),
                                                blurRadius: 20.0,
                                              ),
                                            ]),
                                            child: new FloatingActionButton(
                                              backgroundColor: Colors.pink,
                                              heroTag: "Forward",
                                              child: new Icon(
                                                  Icons.arrow_forward_ios),
                                              onPressed: () {},
                                            ),
                                            margin: new EdgeInsets.only(
                                                top: 20.0, bottom: 20.0),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ))
                      ],
                    )),
              ]))),
    )));
  }
}
