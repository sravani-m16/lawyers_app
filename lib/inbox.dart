import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Inbox extends StatefulWidget {

  @override
  _InboxState createState() => _InboxState();

}

class _InboxState extends State<Inbox> {

  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));


  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: Container(
        child: Center(
        child: Text("Inbox is Empty", style: style, ),
      ),
      ),
    );
  }

  }
