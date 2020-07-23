import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:lawyersapp/client_dashboard.dart';
import 'package:lawyersapp/client_details.dart';
import 'package:lawyersapp/forgot_password.dart';
import 'package:lawyersapp/lawyer_dashboard.dart';
import 'package:lawyersapp/lawyer_details.dart';
import 'package:lawyersapp/sign_up.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


//import 'package:image/image.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _email, _password;

  Firestore db = Firestore.instance;
  int _radioValue = -1;
  String email, password;

  SharedPreferences prefs;

 // FirebaseUser firebaseUser;

  bool isLoggedIn = false;
  bool isLoading = false;

  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0);

  initState() {
    _email = new TextEditingController();
    _password = new TextEditingController();
    super.initState();
  }

  void isSignedIn() async {
    this.setState(() {
      isLoading = true;
    });

    prefs = await SharedPreferences.getInstance();

    if (FirebaseAuth.instance.currentUser() != null) {
      if (await prefs.getInt('radioValue') == 0) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ClientDashboard(/*currentUserId: prefs.getString('uid')*/))
        );
      } else if (await prefs.getInt('radioValue') == 1) {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LawyerDashboard(/*currentUserId: prefs.getString('uid'))*/))
        );
      }


      this.setState(() {
        isLoading = false;
      });
    }
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
  }

  /* final emailField = TextField(
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),


    );
    final passwordField = TextField(
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),

    );
    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xFFd1a545),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {},
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );*/

  /* MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/SignUp': (context) => SignUpPage()
      },
    ); */

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

  Widget showPrimaryButton() {
    return new Padding(
        padding: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
        child: SizedBox(
          height: 40.0,
          child: new RaisedButton(
            elevation: 5.0,
            shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)),
            color: Color(0xFFd1a545),
            child: new Text("Login",
                textAlign: TextAlign.center,
                style: style.copyWith(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            onPressed: signIn,
          ),
        ));
  }

  Widget showSecondaryButton() {
    return new FlatButton(
        child: new Text(
            "New User, Register Here",
            style: style),
        onPressed: signUp
    );
  }

  Widget showReset() {
    return new FlatButton(
        child: new Text(
            "Forgot Passwrord?",
            style: style),
        onPressed: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => ForgotScreen()));
        }
    );
  }

  /* Widget _showCircularProgress() {
    if (_isLoading) {
      return Center(child: CircularProgressIndicator());
    }
    return Container(
      height: 0.0,
      width: 0.0,
    );
  }*/

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

  /* final FlatButton fb = new FlatButton(
      onPressed: () {
        Navigator.pushNamed(context, '/SignUp');
      },
      child: Text("New User, Register Here", style: style,),
    );*/


  /* return Scaffold(
      body: SingleChildScrollView(
      child: Center(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                  child: Image.asset(
                    "assets/images/logo2.jpg",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                emailField,
                SizedBox(height: 25.0),
                passwordField,
                SizedBox(
                  height: 35.0,
                ),
                loginButon,
                SizedBox(
                  height: 15.0,
                ),
                  fb,
                  SizedBox(
                    height: 15.0,
                  ),
              ],
            ),


          ),
        ),
      ),
    )
    );*/

  /* return new Scaffold(
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: _formKey,
                        child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                    child: Image.asset(
        "assets/images/logo2.jpg",
        fit: BoxFit.contain,
    ),
    ),
                    TextFormField(

                      validator: (input) {

                        if(input.isEmpty){

                          return 'Provide an email';

                        }

                      },

                      style: style,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        hintText: "Email",

                      ),

                      onSaved: (input) => _email = input,

                    ),

                    TextFormField(

                      validator: (input) {

                        if(input.length < 6){

                          return 'Longer password please';

                        }

                      },

                      style: style,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                          hintText: "Password",

                      ),

                      onSaved: (input) => _password = input,

                      obscureText: true,

                    ),

                    RaisedButton(

                       child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20.0),
                          color: Color(0xFFd1a545),
                          child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            onPressed: signIn,
                            child: Text("Login",
                                textAlign: TextAlign.center,
                                style: style.copyWith(
                                    color: Colors.white, fontWeight: FontWeight.bold)),
                          ),
                        ),

                    ),

                    FlatButton(
                      child: Text("New User, Register Here", textAlign: TextAlign.center, style: style),
                      onPressed: signUp,
                    )

                  ],

                )

              ),

            ),
    )
    ),
    )
    );*/


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
              showReset(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Radio(
                    value: 0,
                    groupValue: _radioValue,
                    onChanged: (newValue) =>
                        setState(() => _radioValue = newValue),
                  ),
                  new Text('Client'),
                  new Radio(
                    value: 1,
                    groupValue: _radioValue,
                    onChanged: (newValue) =>
                        setState(() => _radioValue = newValue),
                  ),
                  new Text('Lawyer'),
                ],
              ),
              showPrimaryButton(),
              showSecondaryButton(),
            ],
          ),
        )
    );
  }


  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    }
    else {
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

  /*String validatePassword(String value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z][0-9])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = new RegExp(pattern);
    print(value);
    if (value.isEmpty) {
      return 'Please enter password';
    } else {
      if (!regex.hasMatch(value))
        return 'Enter valid password';
      else
        return null;
    }
  }*/

  void signUp() async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }


  void signIn() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        prefs = await SharedPreferences.getInstance();

        await prefs.setInt('radioValue', _radioValue);

        email = prefs.getString('email');
        password = prefs.getString('password');

        if (_radioValue == 0) {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: _email.text, password: _password.text)
              .then((authResult) =>
              Firestore.instance
                  .collection("users")
                  .document(authResult.user.uid)
                  .get()
                  .then((DocumentSnapshot result) {
                return Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ClientsDetails()));
              }));
        }

        else if (_radioValue == 1) {
          FirebaseAuth.instance
              .signInWithEmailAndPassword(
              email: _email.text, password: _password.text)
              .then((authResult) =>
              Firestore.instance
                  .collection("users")
                  .document(authResult.user.uid)
                  .get()
                  .then((DocumentSnapshot result) =>
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => LawyerDetails()))));
        }
      } catch (e) {
        print(e.message);
      }
    } else{

      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text("The email and password are not matched"),
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
     if (email.isEmpty && password.isEmpty) {
      if (_radioValue == -1) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Error"),
                content: Text("The Fields should not be empty"),
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

  @override
  Future<void> resetPassword(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

}

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
