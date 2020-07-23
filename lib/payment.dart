import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/payment_history.dart';
import 'package:lawyersapp/payment_method.dart';
import 'package:lawyersapp/sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Payments extends StatefulWidget {

  @override
  _PaymentsState createState() => _PaymentsState();



}

class _PaymentsState extends State<Payments> {


  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));

  TextStyle style2 = TextStyle(fontFamily: 'Colus', fontSize: 20.0, color: Color(0xFFaa7f21));
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(10, 100, 10, 20),
          child:  ListView(
            children: <Widget>[
              ListTile(
                  title: Text('Add Payment Method', style: style),
                  leading: Icon(Icons.add, color: Color(0xFFd1a545)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentMethod()));
                  },
              ),
              Divider(),
               ListTile(
                  title: Text('Payment Transaction', style: style),
                  leading: Icon(Icons.history, color: Color(0xFFd1a545)),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentHistory()));
                  },
              ),
      ],
    ),
        ),
    );
  }
}