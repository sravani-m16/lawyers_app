import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:lawyersapp/main.dart';

class ForgotScreen extends StatefulWidget{
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
  
}

class _ForgotScreenState extends State<ForgotScreen>{

  String email = "";


  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontWeight: FontWeight.bold, fontSize: 20.0, color: Color(0xFFd1a545));

  TextStyle style2 = TextStyle(fontFamily: 'Colus', fontSize: 20.0, color: Color(0xFFaa7f21));

  TextStyle style3 = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
   return new Scaffold(
     body: Center(
       child: Padding(padding: EdgeInsets.only(top: 50, left: 20, right: 20),
        child: Form(
          key: _formKey,
          child: Column(
          children: <Widget>[
           Text("Link will be sent to the mentioned email...", style: style2,),
           Theme(
             data: ThemeData(
               hintColor: Colors.orangeAccent,
             ),
             child: Padding(padding: EdgeInsets.only(top: 50, left: 20, right: 20),
             child: TextFormField(
               validator: (value){
                 if(value.isEmpty){
                   return "Please enter your email";
                 } else{
                   email = value;
                 }
                 return null;
               },
               style: style,
             ),
             ),
             
           ),

            Padding(
            padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
              child: SizedBox(
                height: 40.0,
                  child: new RaisedButton(
                    elevation: 5.0,
               shape: new RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(30.0)),
               color: Color(0xFFd1a545),
               child: new Text("Submit",
                   textAlign: TextAlign.center,
                   style: style.copyWith(
                       color: Colors.white, fontWeight: FontWeight.bold)),
               onPressed: () {
                      if(_formKey.currentState.validate()) {
                        FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value) => print("Check your mail"));

                        // Create button
                        Widget okButton = FlatButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        );

                        // Create AlertDialog
                        AlertDialog alert = AlertDialog(
                          content: Text("Check your mail."),
                          actions: [
                            okButton,
                          ],
                        );

                        // show the dialog
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return alert;
                            });

                      }
               },
             ),
           )),

         ],
       ),
       ),
     ),
     ),
   );
  }
}