import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/client_dashboard.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:lawyersapp/lawyer_dashboard.dart';
import 'package:lawyersapp/sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {

  Splash({Key key}) : super(key: key);


  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {

 // bool user = Firestore.instance.collection('users').document()

  SharedPreferences prefs;
  int _radioValue;

  initState() async{

    _radioValue = prefs.getInt('radioValue');


    FirebaseAuth.instance
        .currentUser()
        .then((currentUser) => {
          if (currentUser == null)
        {Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()))}

      else if(_radioValue == 0)
        {
          Firestore.instance
              .collection("users")
              .document(currentUser.uid)
              .get()
              .then((DocumentSnapshot result) =>
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ClientDashboard())))
              .catchError((err) => print(err))
        }

      else if(_radioValue == 1) {

              Firestore.instance
                  .collection("users")
                  .document(currentUser.uid)
                  .get()
                  .then((DocumentSnapshot result) =>
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LawyerDashboard())))
                  .catchError((err) => print(err))

            }

    })
        .catchError((err) => print(err));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/splash.jpg'),
      ),
    );
  }
  
}