import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Notifications extends StatefulWidget {

  @override
  _NotificationsState createState() => _NotificationsState();

}

class _NotificationsState extends State<Notifications> {

  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontWeight: FontWeight.bold, fontSize: 20.0, color: Color(0xFFd1a545));

  TextStyle style2 = TextStyle(fontFamily: 'Colus', fontSize: 20.0, color: Color(0xFFaa7f21));

  TextStyle style3 = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));

  bool _email = false;
  bool _push = false;
  bool _text = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(10, 100, 10, 20),
        child:  ListView(
          children: <Widget>[
        new Text("MESSAGES", style: style, ),
        new Text("Recieve messages from clients and lawyers, including consulting requests", style: style3,),
        SwitchListTile(
          title: Text('Email', style: style2),
          value: _email,
          onChanged: (bool value) {
            setState(() {
              _email = value;
            });
          }
        ),
        Divider(),
            SwitchListTile(
                title: Text('Push Notifications', style: style2),
                value: _push,
                onChanged: (bool value) {
                  setState(() {
                    _push = value;
                  });
                }
            ),
            new Text("Receive messages on your mobile or tablet devices", style: style3,),
            Divider(),
            SwitchListTile(
                title: Text('Text Messages', style: style2),
                value: _text,
                onChanged: (bool value) {
                  setState(() {
                    _text = value;
                  });
                }
            ),
        ],
      ),
      ),
    );
  }
}