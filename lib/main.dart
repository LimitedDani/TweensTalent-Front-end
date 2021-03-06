import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:tweenstalent/pages/login.dart';
import 'package:tweenstalent/pages/splashscreen.dart';
import 'package:tweenstalent/pages/register.dart';
import 'package:tweenstalent/pages/forgotpassword.dart';
import 'package:tweenstalent/pages/home.dart';
import 'package:tweenstalent/pages/questions.dart';
import 'package:tweenstalent/pages/results.dart';
import 'package:tweenstalent/pages/occupationalprofile.dart';

import 'package:tweenstalent/pages/certificate.dart';

import 'package:tweenstalent/admin/pages/scanner.dart';
import 'package:tweenstalent/utils.dart' as utils;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  dev() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("natuurtalent", true);
    prefs.setBool("beeldtalent", true);
    prefs.setBool("beweegtalent", true);
    prefs.setBool("menstalent", true);
    prefs.setBool("zelftalent", true);
    prefs.setBool("taaltalent", true);
    prefs.setBool("rekentalent", true);
    prefs.setBool("muziektalent", true);

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    dev();
    return MaterialApp(
      title: 'Tweenstalent',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        canvasColor: Colors.white,
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/admin/scanner': (BuildContext context) => ScanScreen(),




        '/splashscreen': (BuildContext context) => SplashScreen(),
        '/login': (BuildContext context) => LoginPage(),
        '/register': (BuildContext context) => RegisterPage(),
        '/forgotpassword': (BuildContext context) => ForgotPasswordPage(),
        '/home': (BuildContext context) => HomePage(),
        '/results': (BuildContext context) => ResultPage(),
        '/occupationalprofile': (BuildContext context) => OccupationalProfilePage(),
        '/qrcode': (BuildContext context) => GenerateScreen(),

        '/questions/natuurtalent': (BuildContext context) => QuestionPage(
            title: AutoSizeText.rich(
              TextSpan(
                text: "Natuur"?.toUpperCase(),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Talent'?.toUpperCase(), style: TextStyle(color: Colors.white)),
                ],
              ),
              style:
              TextStyle(color: utils.HexColor("#1EDE81")),
              maxLines: 1,
              minFontSize: 32.0,
            ),
            image: new Image(
              image: AssetImage("assets/green.png"),
            )),
        '/questions/beeldtalent': (BuildContext context) => QuestionPage(
            title: AutoSizeText.rich(
              TextSpan(
                text: "Beeld"?.toUpperCase(),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Talent'?.toUpperCase(), style: TextStyle(color: Colors.white)),
                ],
              ),
              style:
              TextStyle(color: utils.HexColor("#6932A5")),
              maxLines: 1,
              minFontSize: 36.0,
            ),
            image: new Image(
              image: AssetImage("assets/purple.png"),
            )),
        '/questions/beweegtalent': (BuildContext context) => QuestionPage(
            title: AutoSizeText.rich(
              TextSpan(
                text: "Beweeg"?.toUpperCase(),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Talent'?.toUpperCase(), style: TextStyle(color: Colors.white)),
                ],
              ),
              style:
              TextStyle(color: utils.HexColor("#FFDD15")),
              maxLines: 1,
              minFontSize: 32.0,
            ),
            image: new Image(
              image: AssetImage("assets/yellow.png"),
            )),
        '/questions/menstalent': (BuildContext context) => QuestionPage(
            title: AutoSizeText.rich(
              TextSpan(
                text: "Mens"?.toUpperCase(),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Talent'?.toUpperCase(), style: TextStyle(color: Colors.white)),
                ],
              ),
              style:
                  TextStyle(color: utils.HexColor("#FF66FC")),
              maxLines: 1,
              minFontSize: 38.0,
            ),
            image: new Image(
              image: AssetImage("assets/pink.png"),
            )),
        '/questions/zelftalent': (BuildContext context) => QuestionPage(
            title: AutoSizeText.rich(
              TextSpan(
                text: "Zelf"?.toUpperCase(),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Talent'?.toUpperCase(), style: TextStyle(color: Colors.white)),
                ],
              ),
              style:
                  TextStyle(color: utils.HexColor("#00B9F1"), fontSize: 40.0),
              maxLines: 1,
            ),
            image: new Image(
              image: AssetImage("assets/lightblue.png"),
            )),
        '/questions/taaltalent': (BuildContext context) => QuestionPage(
            title: AutoSizeText.rich(
              TextSpan(
                text: "Taal"?.toUpperCase(),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Talent'?.toUpperCase(), style: TextStyle(color: Colors.white)),
                ],
              ),
              style:
              TextStyle(color: utils.HexColor("#0076FF"), fontSize: 40.0),
              maxLines: 1,
            ),
            image: new Image(
              image: AssetImage("assets/darkblue.png"),
            )),
        '/questions/muziektalent': (BuildContext context) => QuestionPage(
            title: AutoSizeText.rich(
              TextSpan(
                text: "Muziek"?.toUpperCase(),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Talent'?.toUpperCase(), style: TextStyle(color: Colors.white)),
                ],
              ),
              style:
              TextStyle(color: utils.HexColor("#FF9133"), fontSize: 34.0),
              maxLines: 1,
            ),
            image: new Image(
              image: AssetImage("assets/orange.png"),
            )),
        '/questions/rekentalent': (BuildContext context) => QuestionPage(
            title: AutoSizeText.rich(
              TextSpan(
                text: "Reken"?.toUpperCase(),
                children: <TextSpan>[
                  new TextSpan(
                      text: 'Talent'?.toUpperCase(), style: TextStyle(color: Colors.white)),
                ],
              ),
              style:
              TextStyle(color: utils.HexColor("#F00D4C"), fontSize: 36.0),
              maxLines: 1,
            ),
            image: new Image(
              image: AssetImage("assets/red.png"),
            )),
      },
    );
  }
}
