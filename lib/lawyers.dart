import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lawyersapp/client_dashboard.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class Lawyer extends StatefulWidget {

  @override
  _LawyerState createState() => _LawyerState();
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);
}

class _LawyerState extends State<Lawyer> {
  @override

  TextEditingController controller;

  bool isLoading = false;

  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontWeight: FontWeight.bold, fontSize: 20.0, color: Color(0xFFd1a545));

  TextStyle style2 = TextStyle(fontFamily: 'Colus', fontSize: 20.0, color: Color(0xFFaa7f21));

  TextStyle style3 = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));

  Future<List<Post>> search(String search) async {
  await Future.delayed(Duration(seconds: 2));
  return List.generate(search.length, (int index) {
  return Post(
  "Title : $search $index",
  "Description :$search $index",
  );
  });
  }


  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(

      body:Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(25.0),
            child:TextField(
              decoration: new InputDecoration(
                hintText: 'search',
              ),
              onChanged: onSearch,
              controller: controller,
            ),
          ),

        Expanded(

        child: StreamBuilder(
          stream: Firestore.instance.collection('Lawyers').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(

                ),
              );
            } else {
              return ListView.builder(
                padding: EdgeInsets.all(10.0),
                itemBuilder: (context, index) => buildItem(context, snapshot.data.documents[index]),
                itemCount: snapshot.data.documents.length,
              );
            }
          },
        ),

      ),



      /* Container(
          child: Stack(
            alignment: Alignment.center,
          children: <Widget>[

            //_showForm(),

            new TextField(
              decoration: new InputDecoration(
                hintText: 'search',
              ),
              controller: controller,
            ),
           // showSearch(),
            // List
       new Container(


              child: StreamBuilder(
                stream: Firestore.instance.collection('Lawyers').snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(

                      ),
                    );
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.all(10.0),
                      itemBuilder: (context, index) => buildItem(context, snapshot.data.documents[index]),
                      itemCount: snapshot.data.documents.length,
                    );
                  }
                },
              ),
            ),*/

            // Loading
           /* Positioned(
              child: isLoading ?  Loading() : Container(),
            )*/
          ],
        ),
    );


     /* body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SearchBar<Post>(
                onSearch: search,
                onItemFound: (Post post, int index) {
               return ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.description),
              );
            },
          ),
        ),
      ), */

  }

  Widget _showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          // showSearch(),
          showList(),
        ],
      ),
    );
  }

  Widget showList() {

    new Container(

      child: StreamBuilder(
        stream: Firestore.instance.collection('Lawyers').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(

              ),
            );
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(5.0),
              itemBuilder: (context, index) => buildItem(context, snapshot.data.documents[index]),
              itemCount: snapshot.data.documents.length,
            );
          }
        },
      ),
    );

  }

  Widget showSearch() {

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SearchBar<Post>(
          onSearch: search,
          onItemFound: (Post post, int index) {
            return ListTile(
              title: Text(post.title),
              subtitle: Text(post.description),
            );
          },
        ),
      ),
    );


  }


  Widget buildItem(BuildContext context, DocumentSnapshot document) {

     // return Container();
      return Container(
        child: FlatButton(
          child: Row(
            children: <Widget>[
             /* Material(
                child: document['photoUrl'] != null
                    ? CachedNetworkImage(
                  placeholder: (context, url) => Container(
                    child: CircularProgressIndicator(
                      strokeWidth: 1.0,
                      valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                    ),
                    width: 50.0,
                    height: 50.0,
                    padding: EdgeInsets.all(15.0),
                  ),
                  imageUrl: document['photoUrl'],
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                )
                    : Icon(
                  Icons.account_circle,
                  size: 50.0,
                  color: greyColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(25.0)),
                clipBehavior: Clip.hardEdge,
              ),*/
              Flexible(
                child: Card(
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text('Name: ${document['name']}', style: style,),
                       // alignment: Alignment.left,
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 5.0),
                      ),
                      Container(
                        child: Text(
                          'Experience: ${document['experience'] ?? 'Not available'}',
                          style: style3,
                        ),
                       // alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      ),
                      Container(
                        child: Text(
                          'Specialization: ${document['specialization'] ?? 'Not available'}',
                          style: style,
                        ),
                       // alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      ),
                      Container(
                        child: Text(
                          'Languages Known: ${document['languages known'] ?? 'Not available'}',
                          style: style,
                        ),
                       // alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      ),
                      Container(
                        child: Text(
                          'City: ${document['city'] ?? 'Not available'}',
                          style: style,
                        ),
                       // alignment: Alignment.center,
                        margin: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      )
                    ],
                  ),
                  margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                ),
              ),
            ],
          ),
          onPressed: () {
           /* Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Chat(
                      peerId: document.documentID,
                      peerAvatar: document['photoUrl'],
                    ))); */
          },
          //color: greyColor2,
          padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        margin: EdgeInsets.only(bottom: 5.0, left: 5.0, right: 5.0),
      );
    }

  void onSearch(String value) {
  }
}



  Loading() {

    return Container(
      child: Center(
        child: CircularProgressIndicator(

        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }

