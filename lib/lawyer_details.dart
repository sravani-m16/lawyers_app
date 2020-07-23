import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/client_dashboard.dart';
import 'package:lawyersapp/lawyer_dashboard.dart';
import 'package:lawyersapp/sign_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LawyerDetails extends StatefulWidget {

  LawyerDetails({Key key, this.uid}) : super(key: key);
  final String uid;

  @override
  _LawyerDetailsState createState() => new _LawyerDetailsState();
}

class _LawyerDetailsState extends State<LawyerDetails> {

  Firestore db = Firestore.instance;


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email, _name, _mobile, _website, _address, _practicingCity, _area,
      _pin, _specialization, _experience, _courts, _lang,
      _licenseNo,  _phoneFees, _emailFees, _education, _chatFees,
      _checkbox;

  int _radioValue = -1;

  SharedPreferences prefs;

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

  Widget showWebInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        autofocus: false,
        style: style,
        keyboardType: TextInputType.text,
        decoration: new InputDecoration(
          hintText: 'Website(Optional)',
        ),
        onSaved: (value) => _website = value,
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
          hintText: 'Practicing City',
        ),
        validator: (value) => value.isEmpty ? 'City can\'t be empty' : null,
        onSaved: (value) => _practicingCity = value,
      ),
    );
  }

  Widget showSpecInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: style,
        decoration: new InputDecoration(
          hintText: 'Specialization',
        ),
        validator: (value) =>
        value.isEmpty
            ? 'Specialization can\'t be empty'
            : null,
        onSaved: (value) => _specialization = value,
      ),
    );
  }

  Widget showExpInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        autofocus: false,
        style: style,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(
          hintText: 'Experience (in years)',
        ),
        validator: (value) =>
        value.isEmpty
            ? 'Experience can\'t be empty'
            : null,
        onSaved: (value) => _experience = value,
      ),
    );
  }

  Widget showEducationInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 2,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: style,
        decoration: new InputDecoration(
          hintText: 'Education Details',
        ),
        validator: (value) =>
        value.isEmpty
            ? 'Education Details can\'t be empty'
            : null,
        onSaved: (value) => _education = value,
      ),
    );
  }

  Widget showCourtsInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: style,
        decoration: new InputDecoration(
          hintText: 'Practicing Courts',
        ),
        validator: (value) =>
        value.isEmpty
            ? 'Practicing Courts can\'t be empty'
            : null,
        onSaved: (value) => _courts = value,
      ),
    );
  }

  Widget showLangInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 2,
        keyboardType: TextInputType.text,
        autofocus: false,
        style: style,
        decoration: new InputDecoration(
          hintText: 'Languages Known',
        ),
        validator: (value) =>
        value.isEmpty
            ? 'This field can\'t be empty'
            : null,
        onSaved: (value) => _lang = value,
      ),
    );
  }

  Widget showLicenseInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        style: style,
        keyboardType: TextInputType.text,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'License Number',
        ),
        validator: (value) =>
        value.isEmpty
            ? 'This field can\'t be empty'
            : null,
        onSaved: (value) => _licenseNo = value,
      ),
    );
  }

  Widget showFeesInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new Row(
        children: <Widget>[

          showPhoneFees(),
          showEmailFees(),
          showChatFees(),
        ],
      )
    );
  }

  Widget showPhoneFees() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child:new TextFormField(
        maxLines: 1,
        style: style,
        keyboardType: TextInputType.number,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Phone Fees',
        ),
        validator: (value) =>
        value.isEmpty
            ? 'This field can\'t be empty'
            : null,
        onSaved: (value) => _phoneFees = value,
    ),
    );

  }

  Widget showEmailFees() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
    child:new TextFormField(
      maxLines: 1,
      style: style,
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: new InputDecoration(
        hintText: 'Email Fees',
      ),
      validator: (value) =>
      value.isEmpty
          ? 'This field can\'t be empty'
          : null,
      onSaved: (value) => _emailFees = value,
    ),
    );

  }

  Widget showChatFees() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
    child:new TextFormField(
      maxLines: 1,
      style: style,
      keyboardType: TextInputType.number,
      autofocus: false,
      decoration: new InputDecoration(
        hintText: 'Chat Fees',
      ),
      validator: (value) =>
      value.isEmpty
          ? 'This field can\'t be empty'
          : null,
      onSaved: (value) => _chatFees = value,
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
              showWebInput(),
              showAddressInput(),
              showCityInput(),
              showAreaInput(),
              showPinInput(),
              showEducationInput(),
              showSpecInput(),
              showExpInput(),
              showCourtsInput(),
              showLangInput(),
              showLicenseInput(),
              showEmailFees(),
              showChatFees(),
              showPhoneFees(),
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
        await db.collection("Lawyers").add(
            {
              'name': _name,
              'gender': _radioValue,
              'mobile': int.parse(_mobile),
              'website': _website,
              'address': _address,
              'area': _area,
              'city': _practicingCity,
              'pin': int.parse(_pin),
              'education details': _education,
              'experience': int.parse(_experience),
              'specialization': _specialization,
              'practicing courts' : _courts,
              'languages known' : _lang,
              'license number' : _licenseNo,
              'email fees' : int.parse(_emailFees),
              'phone fees' : int.parse(_phoneFees),
              'chat fees' : int.parse(_chatFees)
            }
        );

        prefs = await SharedPreferences.getInstance();
        
        await prefs.setString('name', _name);
        await prefs.setString('mobile', _mobile);
        await prefs.setString('address', _address);
        await prefs.setString('area', _area);
        await prefs.setString('city', _practicingCity);
        await prefs.setString('education details', _education);
        await prefs.setString('specialization', _specialization);
        await prefs.setString('courts', _courts);
        await prefs.setString('website', _website);
        await prefs.setString('languages known', _lang);
        await prefs.setString('license number', _licenseNo);
        await prefs.setString('experience', _experience);
        await prefs.setString('pin', _pin);
        await prefs.setString('email fees', _emailFees);
        await prefs.setString('phone fees', _phoneFees);
        await prefs.setString('chat fees', _chatFees);


          // Create button
          Widget okButton = FlatButton(
            child: Text("OK"),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LawyerDashboard()));
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
