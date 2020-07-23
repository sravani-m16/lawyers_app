import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/client_dashboard.dart';
import 'package:lawyersapp/lawyer_dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class Advice extends StatefulWidget {

@override
_AdviceState createState() => _AdviceState();
}

class _AdviceState extends State<Advice> {

  Firestore db = Firestore.instance;

  List<String> _topics =['Select a topic', 'Accident', 'ANY', 'Banking', 'Business', 'Civil', 'Constitution', 'Consumer Protection',
  'Criminal', 'Environmental', 'Family', 'Human Rights', 'Information Technology', 'Insurance', 'Intellectual Property',
  'International Law', 'Labor', 'Maritime Law', 'Motor Vehicle', 'Notary', 'Property', 'Tax'];

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _des, _heading, _topic;
  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _showForm()
            ],
          ),
        ),
      ),
    );
  }

  Widget _showForm() {
    return new Container(
        padding: EdgeInsets.all(16.0),
        child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              showDescInput(),
              showHeadingInput(),
              showTopicInput(),
              showPrimaryButton()
            ],
          ),
        )
    );
  }


  Widget showDescInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 10,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: style,

        decoration: new InputDecoration(

            hintText: 'Describe your Problem/Question'
                '(Min 60 Characters)',


            border: new OutlineInputBorder(
                borderRadius: const BorderRadius.all(
                      const Radius.circular(10.0),
    ),

            ),
      ),
        validator: (value) => value.isEmpty ? 'Description can\'t be empty' : null,
        onSaved: (value) => _des = value.trim(),
      ),
    );
  }

  Widget showHeadingInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 2,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: style,
        decoration: new InputDecoration(

          hintText: 'Provide an Appropriate Heading',

          border: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
              
            ),

          ),
        ),
        validator: (value) => value.isEmpty ? 'Heading can\'t be empty' : null,
        onSaved: (value) => _heading = value.trim(),
      ),
    );
  }

  Widget showTopicInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),

        child: DropdownButton<String>(
            items: _topics.map((String val) {
              return new DropdownMenuItem<String>(
                value: val,
                child: new Text(val),
              );
            }).toList(),
            hint: Text("Please choose a location"),
            onChanged: (newVal) {
              _topic = newVal;
              this.setState(() {});
            })
    );

       /* child: new FlatButton(
            onPressed: topicAlert,
            child: Text('Select Topic', style: style,),
          shape: new OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(10.0),
            ),

          ),

        ) */
  }

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Color(0xFFd1a545),
            child: new Text("Submit Question",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            onPressed: saveData,
          ),
        ));
  }

 /* topicAlert() {

    Widget civil = SimpleDialogOption(
      child: const Text('Civil'),
      onPressed: () {
           db.collection('advice').add(
               {
                 'topic': "Civil"
               }
          );
      },
    );
    Widget criminal = SimpleDialogOption(
      child: const Text('Criminal'),
      onPressed: () {
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => LawyerDashboard()));
        //prefs.setString('optionTwo', 'Lawyer');
      },
    );

    Widget accident = SimpleDialogOption(
      child: const Text('Accident'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );

    Widget hr = SimpleDialogOption(
      child: const Text('Human Rights'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );

    Widget tax = SimpleDialogOption(
      child: const Text('Tax'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );

    Widget family = SimpleDialogOption(
      child: const Text('Family'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );

    Widget bank = SimpleDialogOption(
      child: const Text('Banking'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );
    Widget motor = SimpleDialogOption(
      child: const Text('Motor Vehicle'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );
    Widget labor = SimpleDialogOption(
      child: const Text('Labor'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );
    Widget property = SimpleDialogOption(
      child: const Text('Property'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );

    Widget it = SimpleDialogOption(
      child: const Text('Information Technology'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );

    Widget consumer = SimpleDialogOption(
      child: const Text('Consumer'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );

    Widget insurance = SimpleDialogOption(
      child: const Text('Insurance'),
      onPressed: () {
        //Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
        //prefs.setString('optionOne', 'Client');
      },
    );

    // set up the SimpleDialog
    SimpleDialog dialog = SimpleDialog(
      children: <Widget>[
        it,
        bank,
        civil,
        consumer,
        criminal,
        family,
        property,
        tax,
        motor,
        hr,
        accident,
        labor,
        insurance,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return dialog;
      },
    );
  } */

  void saveData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {

         await db.collection("advice").add(
          {
            'description': _des,
            'heading': _heading,
            //'mobile': _mobile,
            'topic': _topic
          }
        );

         Widget okButton = FlatButton(
           child: Text("OK"),
           onPressed: () {
             Navigator.of(context).pop();
           },
         );

         // Create AlertDialog
         AlertDialog alert = AlertDialog(
           content: Text("Your Question is submitted."),
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
      catch (e) {
        print(e.message);
      }
    }
  }

}