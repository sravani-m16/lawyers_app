import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:lawyersapp/advice.dart';
import 'package:lawyersapp/inbox.dart';
import 'package:lawyersapp/law_firm.dart';
import 'package:lawyersapp/lawyers.dart';
import 'package:lawyersapp/legal_ques.dart';
import 'package:lawyersapp/profile.dart';
import 'package:lawyersapp/sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ClientDashboard extends StatefulWidget {
 // final String currentUserId;

 // ClientDashboard({Key key, @required this.currentUserId}) : super(key: key);


  @override
  _ClientDashboardState createState() => _ClientDashboardState(/*currentUserId: currentUserId*/);
}

class _ClientDashboardState extends State<ClientDashboard> {

 // _ClientDashboardState({Key key, @required this.currentUserId});

  int _currentIndex = 0;

  //final String currentUserId;

  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0);

  final title = ['Advice', 'Lawyers', 'Law Firm', 'Legal Questions'];

  final images = [
    'assets/images/advice.jpg',
    'assets/images/people.png',
    'assets/images/law firm.jpg',
    'assets/images/legal q.jpg'
  ];



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
                title: Text('Advice', style: style,),
                trailing: Image.asset("assets/images/advice.jpg"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Advice()));
                },
              ),
              Divider(),
              ListTile(
                title: Text('Lawyers', style: style),
                trailing: Image.asset("assets/images/people.png"),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Lawyer()));
                },
              ),
            ],
          ),

        /* child: ListView.separated(
          itemCount: title.length,
          itemBuilder: (BuildContext context , int index) {
            return Card( //                           <-- Card widget
              child: ListTile(
                leading: Image.asset(images[index]),
                title: Text(title[index], style: style,),
              /*  onTap: () {
                  if(title[index] == 0 && images[index] == 0) {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => Advice()));
            } else if (title[index] == 1) {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => Lawyer()));
            } else if (title[index] == 2) {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => LawFirm()));
            } else if (title[index] == 3) {
            Navigator.push(
            context, MaterialPageRoute(builder: (context) => LegalQuestion()));
            }
                  },*/
            ),
            );
                },
          separatorBuilder: (context, index) {
            return Divider();
          },
        ),*/
      ),


        /*children: <Widget>[
              ListTile(
                leading: Image.asset('assts/images/advice.jpg'),
                title: Text('Advice', style: style,),
              ),
              ListTile(
                leading: Icon(Icons.brightness_3),
                title: Text('Moon'),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Star'),
              ),
            ],*/

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 25,
        unselectedFontSize: 20,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xFFd1a545)),
            title: Text('Home', style: style),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox, color: Color(0xFFd1a545)),
            title: Text('Inbox', style: style),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Color(0xFFd1a545)),
            title: Text('Profile', style: style),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;

            if (_currentIndex == 1) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Inbox()));
            }
            else if (_currentIndex == 2) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()));
            }
          });
        },
      ),

    );
  }


 /* void _listViewClick() {
    if (title == "Advice") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Advice()));
    } else if (title == "Lawyers") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Lawyer()));
    } else if (title == "Law Firm") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LawFirm()));
    } else if (title == "Legal Questions") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LegalQuestion()));
    }
  } */
}

