import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lawyersapp/sign_in.dart';
//import 'package:image/image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

 // Firestore db = Firestore.instance;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email, _password, _confirmPass;
  int _radioValue = 0;

  SharedPreferences prefs;
  FirebaseUser currentUser;
  String email, pass;

  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0);

  @override
  initState() {
    _email = new TextEditingController();
    _password = new TextEditingController();
    _confirmPass = new TextEditingController();
    super.initState();
  }


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
   /* return new Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    validator: validateEmail ,
                    decoration: InputDecoration(
                        labelText: 'Email'
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (input) => _email = input,
                  ),
                  TextFormField(
                    validator: validatePassword,
                    decoration: InputDecoration(
                        labelText: 'Password'
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    onSaved: (input) => _password = input,
                    obscureText: true,
                  ),
                  TextFormField(
                    validator: validateMobile,
                    decoration: InputDecoration(
                        labelText: 'Mobile'),
                    keyboardType: TextInputType.phone,

                    onSaved: (String input) => _mobile = input,
                  ),
                 /* new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Radio(
                        value: 0,
                        groupValue: _radioValue,
                        onChanged: handleRadio,
                      ),
                      new Text('Lawyer'),
                      new Radio(
                        value: 1,
                        groupValue: _radioValue,
                        onChanged: handleRadio,
                      ),
                      new Text('Client'),
                    ],
                  ),*/
                  RaisedButton(
                    onPressed: signUp,
                    child: Text('Sign up'),
                  ),
                ],
              )
          ),
        ),
      ),
    );*/
  }

  Widget showLogo() {
    return new Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.fromLTRB(0.0, 70.0, 0.0, 0.0),
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 48.0,
          child: Image.asset('assets/images/logo2.jpg'),
        ),
      ),
    );
  }

  Widget showEmailInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 100.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Email',
            icon: new Icon(
              Icons.mail,
              color: Color(0xFFd1a545),
            )),
        validator: emailValidator,
       controller: _email,
       // onSaved: (value) => _email = value.trim(),
      ),
    );
  }



  Widget showPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Password',
            icon: new Icon(
              Icons.lock,
              color: Color(0xFFd1a545),
            )),
        validator: pwdValidator,
       controller: _password,
       // onSaved: (value) => _password = value.trim(),
      ),
    );
  }

  Widget showConfirmPasswordInput() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 0.0),
      child: new TextFormField(
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
            hintText: 'Confirm Password',
            icon: new Icon(
              Icons.lock,
              color: Color(0xFFd1a545),
            )),
        validator: pwdValidator,
        controller: _confirmPass,
        // onSaved: (value) => _password = value.trim(),
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
            child: new Text("Register",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            onPressed: signUp,
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
            showLogo(),
            showEmailInput(),
            showPasswordInput(),
            showConfirmPasswordInput(),

            showPrimaryButton(),

          ],
        ),
      ));
}


  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  Future<bool> usernameCheck() async {
    final result = await Firestore.instance
        .collection('users')
        .where('email', isEqualTo: _email)
        .getDocuments();
    return result.documents.isEmpty;
  }


  void signUp() async {
    final result = await usernameCheck();

    if (!result) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("The Email already exists. "),
              actions: <Widget>[
                FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }

    else {
      if (_formKey.currentState.validate()) {
        _formKey.currentState.save();
        try {
          FirebaseAuth.instance
              .createUserWithEmailAndPassword(
              email: _email.text,
              password: _password.text)
              .then((authResult) =>
              Firestore.instance
                  .collection("users")
                  .document(authResult.user.uid)
                  .setData({
                "uid": authResult.user.uid,
                "email": _email.text,
                "password": _password.text,
              })).then((result) =>
          {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage())),

          });

          prefs = await SharedPreferences.getInstance();

          await prefs.setString('email', _email.text);
          await prefs.setString('password', _password.text);
          await prefs.setString('uid', currentUser.uid);
          /* await db.collection("user").add(
          {
            'email': _email,
            'password': _password,
            'mobile': _mobile,
            'radioValue': _radioValue,
          }
        ); */

          // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);

          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
        } catch (e) {
          print(e.message);
        }
      }
      else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("The Fields should not be empty. "),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Close"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              );
            });
      }
    }
  }

 /* void handleRadio(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:

          break;

        case 1:
          break;
      }
    });
  }*/
}
