import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/client_dashboard.dart';
import 'package:lawyersapp/lawyer_dashboard.dart';
import 'package:lawyersapp/sign_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


class ClientsDetails extends StatefulWidget {
  @override
  _ClientsDetailsState createState() => new _ClientsDetailsState();
}

class _ClientsDetailsState extends State<ClientsDetails> {

  Firestore db = Firestore.instance;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _name, _mobile, _website, _address, _practicingCity, _area,
      _pin, _specialization, _experience, _courts, _lang,
      _licenseNo,  _phoneFees, _emailFees, _education, _chatFees,
      _checkbox;

  int _radioValue = -1;

  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: <Widget>[
              _showForm(),
            ],
          ),
        ),
      ),
    );
  }


  Widget showNameInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: style,
        decoration: new InputDecoration(
          hintText: 'Name',
        ),
        validator: (value) => value.isEmpty ? 'Name can\'t be empty' : null,
        onSaved: (value) => _name = value,
      ),
    );
  }

  Widget showMobileInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        style: style,
        decoration: new InputDecoration(
          hintText: 'Mobile',
        ),
        validator: (value) => value.isEmpty ? 'Mobile can\'t be empty' : null,
        onSaved: (value) => _mobile = value,
      ),
    );
  }


  Widget showAddressInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 2,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: style,
        decoration: new InputDecoration(
          hintText: 'Address',
        ),
        validator: (value) => value.isEmpty ? 'Address can\'t be empty' : null,
        onSaved: (value) => _address = value,
      ),
    );
  }

  Widget showAreaInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 2,
        autofocus: false,
        style: style,
        keyboardType: TextInputType.text,
        decoration: new InputDecoration(
          hintText: 'Area/Locality',
        ),
        validator: (value) => value.isEmpty ? 'Area can\'t be empty' : null,
        onSaved: (value) => _area = value,
      ),
    );
  }

  Widget showPinInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.number,
        autofocus: false,
        style: style,
        decoration: new InputDecoration(
          hintText: 'PIN/ZIP Code',
        ),
        validator: (value) => value.isEmpty ? 'PIN can\'t be empty' : null,
        onSaved: (value) => _pin = value,
      ),
    );
  }

  Widget showCityInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        style: style,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'City',
        ),
        validator: (value) => value.isEmpty ? 'City can\'t be empty' : null,
        onSaved: (value) => _practicingCity = value,
      ),
    );
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
            child: new Text("Save",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            onPressed: saveData,
          ),
        ));
  }



  Widget _showForm() {
    return new Container(
      padding: EdgeInsets.all(16.0),
      child: new Form(
          key: _formKey,
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[
              showNameInput(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: (newValue) => setState(() => _radioValue = newValue),
                  ),
                  new Text('Male'),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: (newValue) => setState(() => _radioValue = newValue),
                  ),
                  new Text('Female'),
                ],
              ),
              showMobileInput(),
              showAddressInput(),
              showCityInput(),
              showAreaInput(),
              showPinInput(),
              /* new Row(
                children: <Widget>[
                  new TextFormField (

                  )
                ],
              ),*/
              //showFeesInput(),
              showPrimaryButton(),

            ],
          )


      ),
    );
  }


  void saveData() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await db.collection("Clients").add(
            {
              'name': _name,
              'gender': _radioValue,
              'mobile': int.parse(_mobile),
              'address': _address,
              'area': _area,
              'city': _practicingCity,
              'pin': int.parse(_pin),

            }
        );


        // Create button
        Widget okButton = FlatButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
          },
        );

        // Create AlertDialog
        AlertDialog alert = AlertDialog(
          content: Text("Details are saved."),
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



        //   Navigator.pushReplacement(
        //  context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
