import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/clients.dart';
import 'package:lawyersapp/inbox.dart';
import 'package:lawyersapp/legal_ques.dart';
import 'package:lawyersapp/profile.dart';
import 'package:lawyersapp/sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LawyerDashboard extends StatefulWidget {

 // final String currentUserId;

 // LawyerDashboard({Key key, @required this.currentUserId}) : super(key: key);

  @override
  _LawyerDashboardState createState() => _LawyerDashboardState(/*currentUserId: currentUserId*/);

}

class _LawyerDashboardState extends State<LawyerDashboard> {

 // _LawyerDashboardState({Key key, @required this.currentUserId});

 // final String currentUserId;

  int _currentIndex = 0;
  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));

  final title = ['Clients', 'Legal Blog', 'News Report', 'Legal Documents'];

  final images = [
    'assets/images/people.png',
    'assets/images/blog.jpg',
    'assets/images/news report.jpg',
    'assets/images/doc.jpg'
  ];


  Widget _myListView(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Clients', style: style),
          trailing: Image.asset("assets/images/people.png"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Clients()));
          },
        ),
        ListTile(
          title: Text('Solutions', style: style),
          trailing: Image.asset("assets/images/legal q.jpg"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => LegalQuestion()));
          },
        ),
        ListTile(
          title: Text('Star'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            print('Star');
          },
        ),
      ],
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.fromLTRB(10, 200, 10, 20),
         child: ListView(
           children: <Widget>[
             ListTile(
               title: Text('Clients', style: style),
               trailing: Image.asset("assets/images/people.png"),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => Clients()));
               },
             ),
             Divider(),
             ListTile(
               title: Text('Solutions', style: style),
               trailing: Image.asset("assets/images/legal q.jpg"),
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => LegalQuestion()));
               },
             ),
           ],
         ),
         /* separatorBuilder: (context, index) {
            return Divider();
          },*/
        ),


      /* new Card(
            child: Row(
          children: <Widget>[
          Padding(
          padding: EdgeInsets.all(10.0),
            child: Container(
              width: 100.0,
              height: 100.0,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  image: DecorationImage(
                      image: AssetImage('assets/images/advice.jpg'),
                      fit: BoxFit.cover),
                  borderRadius:
                  BorderRadius.all(Radius.circular(75.0)),
                  boxShadow: [
                    BoxShadow(blurRadius: 7.0, color: Colors.black)
                  ]),
              child: Chip(
                label: Text('Advice'),
                shadowColor: Colors.blue,
                backgroundColor: Color(0xFFd1a545),
                elevation: 10,
                autofocus: true,
            ),

                ),

        ),
        ],
      ),
          ),
                new Card(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/people.png'),
                                  fit: BoxFit.cover),
                              borderRadius:
                              BorderRadius.all(Radius.circular(75.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ]),
                          child: Chip(
                            label: Text('Lawyers'),
                            shadowColor: Colors.blue,
                            backgroundColor: Color(0xFFd1a545),
                            elevation: 10,
                            autofocus: true,
                          ),

                        ),

                      ),
                    ],
                  ),
                ),
                new Card(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/law firm.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius:
                              BorderRadius.all(Radius.circular(75.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ]),
                          child: Chip(
                            label: Text('Law Firm'),
                            shadowColor: Colors.blue,
                            backgroundColor: Color(0xFFd1a545),
                            elevation: 10,
                            autofocus: true,
                          ),

                        ),

                      ),
                    ],
                  ),
                ),
                new Card(
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                  image: AssetImage('assets/images/legal q.jpg'),
                                  fit: BoxFit.cover),
                              borderRadius:
                              BorderRadius.all(Radius.circular(75.0)),
                              boxShadow: [
                                BoxShadow(blurRadius: 7.0, color: Colors.black)
                              ]),
                          //child:Text('Legal Questions', style: style),
                          padding: EdgeInsets.all(30.0),
                          child: Chip(
                            label: Text('Legal Questions'),
                            shadowColor: Colors.blue,
                            backgroundColor: Color(0xFFd1a545),
                            elevation: 10,
                            autofocus: true,
                          ),

                        ),

                      ),
                    ],
                  ),
                ),*/


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


  void _listViewClick() {


  }

  void showHome() {}

  void showInbox() {}

  void showProfile() {}

}

class Content extends StatefulWidget {

  const Content({
    this.title,
    this.screenPage,
  });

  final String title;
  final Widget screenPage;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

  }
}
