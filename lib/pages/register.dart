import 'package:flutter/material.dart';
import 'package:tweenstalent/utils.dart' as utils;

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  String selectedDegree, selectedSchool;
  bool girl = false, boy = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Material(
            child: new SingleChildScrollView(
      child: new Container(
          padding: EdgeInsets.only(top: 30),
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
                child: new ListView(
                  children: <Widget>[
                    new Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: new Text(
                            "Maak jouw account aan"?.toUpperCase(),
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 30.0),
                          ),
                        ),
                        new SizedBox(
                          height: 40.0,
                        ),
                        new Container(
                          width: MediaQuery.of(context).size.width / 1.3,
                          child: new Row(
                            children: <Widget>[
                              new GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      boy = true;
                                      girl = false;
                                    });
                                  },
                                  child: new Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          1.3 /
                                          2,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: boy
                                                      ? utils.colorLogo1
                                                      : Colors.transparent,
                                                  width: 2.0))),
                                      child: new Row(
                                        children: <Widget>[
                                          new Icon(
                                            Icons.adjust,
                                            color: boy
                                                ? utils.colorLogo1
                                                : Colors.white,
                                          ),
                                          new SizedBox(
                                            width: 10,
                                          ),
                                          new Text(
                                            "Jongen",
                                            style: TextStyle(
                                                color: boy
                                                    ? utils.colorLogo1
                                                    : Colors.white),
                                          )
                                        ],
                                      ))),
                              new GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      boy = false;
                                      girl = true;
                                    });
                                  },
                                  child: new Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width /
                                          1.3 /
                                          2,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: girl
                                                      ? utils.colorLogo1
                                                      : Colors.transparent,
                                                  width: 2.0))),
                                      child: new Row(
                                        children: <Widget>[
                                          new Icon(
                                            Icons.markunread_mailbox,
                                            color: girl
                                                ? utils.colorLogo1
                                                : Colors.white,
                                          ),
                                          new SizedBox(
                                            width: 10,
                                          ),
                                          new Text(
                                            "Meisje",
                                            style: TextStyle(
                                                color: girl
                                                    ? utils.colorLogo1
                                                    : Colors.white),
                                          )
                                        ],
                                      )))
                            ],
                          ),
                        ),
                        new SizedBox(
                          height: 30,
                        ),
                        new Form(
                            key: this._formKey,
                            child: new Container(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: new Column(
                                children: <Widget>[
                                  new Container(
                                    padding: EdgeInsets.only(left: 20.0),
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    height: 60,
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10.0)),
                                      color: Colors.white,
                                    ),
                                    child: new TextFormField(
                                        decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Naam',
                                            labelText: 'Naam')),
                                  ),
                                  new Container(
                                    padding: EdgeInsets.only(left: 20.0),
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10.0)),
                                      color: Colors.white,
                                    ),
                                    height: 60,
                                    child: new DropdownButtonFormField(
                                        value: selectedSchool,
                                        items: [
                                          DropdownMenuItem<String>(
                                            value: 'MediaCollege',
                                            child: Text('Mediacollege'),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'ROC',
                                            child: Text('ROC'),
                                          ),
                                        ],
                                        onChanged: (value) {
                                          setState(() => selectedSchool = value);
                                        },
                                        decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'School',
                                            labelText: 'School')),
                                  ),
                                  new Container(
                                    padding: EdgeInsets.only(left: 20.0),
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10.0)),
                                      color: Colors.white,
                                    ),
                                    height: 60,
                                    child: new DropdownButtonFormField(
                                        value: selectedDegree,
                                        items: [
                                          DropdownMenuItem<String>(
                                            value: 'VMBO-K',
                                            child: Text('VMBO-K'),
                                          ),
                                          DropdownMenuItem<String>(
                                            value: 'VMBO-S',
                                            child: Text('VMBO-S'),
                                          )
                                        ],
                                        onChanged: (value) {
                                          setState(() => selectedDegree = value);
                                        },
                                        decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Schooladvies',
                                            labelText: 'Schooladvies')),
                                  ),
                                  new Container(
                                    padding: EdgeInsets.only(left: 20.0),
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10.0)),
                                      color: Colors.white,
                                    ),
                                    height: 60,
                                    child: new TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        decoration: new InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'you@example.com',
                                          labelText: 'E-mailadres',
                                        )),
                                  ),
                                  new Container(
                                    padding: EdgeInsets.only(left: 20.0),
                                    margin: EdgeInsets.only(bottom: 15.0),
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10.0)),
                                      color: Colors.white,
                                    ),
                                    height: 60,
                                    child: new TextFormField(
                                        obscureText: true,
                                        decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '•••••••••••',
                                            labelText: 'Wachtwoord')),
                                  ),
                                  new Container(
                                    padding: EdgeInsets.only(left: 20.0),
                                    decoration: new BoxDecoration(
                                      borderRadius: new BorderRadius.all(
                                          new Radius.circular(10.0)),
                                      color: Colors.white,
                                    ),
                                    height: 60,
                                    child: new TextFormField(
                                        obscureText: true,
                                        decoration: new InputDecoration(
                                            border: InputBorder.none,
                                            hintText: '•••••••••••',
                                            labelText: 'Wachtwoord herhalen')),
                                  ),
                                  new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Container(
                                        width: MediaQuery.of(context).size.width / 2.8,
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: utils.HexColor("#AA1741"),
                                            offset: Offset(0.0, 1.5),
                                            blurRadius: 20.0,
                                          ),
                                        ]),
                                        child: new RaisedButton(
                                          child: new Text(
                                            'Terug',
                                            style: new TextStyle(color: Colors.white),
                                          ),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                              new BorderRadius.circular(30.0)),
                                          onPressed: () {Navigator.pop(context);},
                                          color: utils.HexColor("#AA1741"),
                                        ),
                                        margin: new EdgeInsets.only(top: 20.0, bottom: 70.0),
                                      ),
                                      new Container(
                                        width: MediaQuery.of(context).size.width / 2.8,
                                        decoration: BoxDecoration(boxShadow: [
                                          BoxShadow(
                                            color: utils.HexColor("#AA1741"),
                                            offset: Offset(0.0, 1.5),
                                            blurRadius: 20.0,
                                          ),
                                        ]),
                                        child: new RaisedButton(
                                          child: new Text(
                                            'Registreren',
                                            style: new TextStyle(color: Colors.white),
                                          ),
                                          shape: new RoundedRectangleBorder(
                                              borderRadius:
                                              new BorderRadius.circular(30.0)),
                                          onPressed: () => null,
                                          color: utils.HexColor("#AA1741"),
                                        ),
                                        margin: new EdgeInsets.only(top: 20.0, bottom: 70.0),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ],
                    )
                  ],
                )),
          ])),
    )));
  }
}
