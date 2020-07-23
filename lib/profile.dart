import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/client_details.dart';
import 'package:lawyersapp/client_profile.dart';
import 'package:lawyersapp/lawyer_details.dart';
import 'package:lawyersapp/notification.dart';
import 'package:lawyersapp/notification.dart';
import 'package:lawyersapp/payment.dart';
import 'package:lawyersapp/sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'lawyer_profile.dart';

class Profile extends StatefulWidget {

  @override
  _ProfileState createState() => _ProfileState();

}

class _ProfileState extends State<Profile> {

  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));

  TextStyle style2 = TextStyle(fontFamily: 'Colus', fontSize: 20.0, color: Color(0xFFaa7f21));

  SharedPreferences prefs;
  int _radioValue;


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        body: Container(
          color: Colors.white,
        padding: EdgeInsets.fromLTRB(10, 100, 10, 20),
          child:  ListView(
            children: <Widget>[
              new Text("ACCOUNT SETTINGS", style: style2, textAlign: TextAlign.center, ),
              ListTile(
                title: Text('Personal Information', style: style),
                trailing: Image.asset("assets/images/people.png"),
                onTap: () {
                  personal();
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Payments', style: style),
                trailing: Image.asset("assets/images/payment.jpg"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Payments()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Notifications', style: style),
                trailing: Image.asset("assets/images/notification.jpg"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Notifications()));
                },
              ),Divider(),

              ListTile(
                title: Text('Give Us Feedback', style: style),
                trailing: Image.asset("assets/images/feedback.jpg"),
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
                },
              ),
              Divider(),
              new Text("LEGAL", style: style2, textAlign: TextAlign.center),

              ListTile(
                title: Text('Terms of Service', style: style),
                trailing: Image.asset("assets/images/service.jpg"),
                onTap: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Log out', style: style),
                onTap: () {
                  prefs.remove('email');
                  prefs.remove('password');
                  FirebaseAuth.instance
                      .signOut()
                      .then((result) =>
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage())))
                      .catchError((err) => print(err));
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => ()));
                },
              ),
             ],
          ),
    ),
    );
    }

  void personal() async {

    prefs = await SharedPreferences.getInstance();

    _radioValue = prefs.getInt('radioValue');

    if(_radioValue == 0) {

      Navigator.push(context, MaterialPageRoute(builder: (context) => ClientProfile()));

    }

    else if(_radioValue == 1) {

      Navigator.push(context, MaterialPageRoute(builder: (context) => LawyerProfile()));
    }

  }

}
