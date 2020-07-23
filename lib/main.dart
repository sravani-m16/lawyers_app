import 'package:flutter/material.dart';
import 'package:lawyersapp/advice.dart';
import 'package:lawyersapp/client_dashboard.dart';
import 'package:lawyersapp/client_details.dart';
import 'package:lawyersapp/lawyer_profile.dart';
import 'package:lawyersapp/lawyers.dart';
import 'package:lawyersapp/notification.dart';
import 'package:lawyersapp/profile.dart';
import 'package:lawyersapp/sign_in.dart';
import 'package:lawyersapp/sign_up.dart';
import 'welcome_page.dart';
import 'package:lawyersapp/lawyer_details.dart';
import 'package:lawyersapp/lawyer_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:image/image.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  //SharedPreferences pref;

  BuildContext get context => null;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(
        primarySwatch: colorCustom,
        backgroundColor: Color(0xf7f7f7),
      ),
      home: LawyerProfile(),
    );


  }

 /* Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var email = prefs.getString('email');
    var pass = prefs.getString('password');
    var optOne = prefs.getString('optionOne');
    var optTwo = prefs.getString('optionTwo');
    runApp(MaterialApp(home: email == null && pass == null ? LoginPage() : ClientDashboard() ));
  }*/

 /* Future<void> main2() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var optOne = prefs.getString('optionOne');
    var optTwo = prefs.getString('optionTwo');
    runApp(MaterialApp(home:  optTwo != null ? LawyerDashboard() : ClientDashboard() ));
  } */

 /* selection() async{
    pref = await SharedPreferences.getInstance();
    if(pref.getString('email') == null && pref.getString('password') == null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
    else if(pref.getString('email') != null && pref.getString('password') != null) {
      if(pref.getString('optionOne') != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ClientDashboard()));
      }
      else if(pref.getString('optionTwo') != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LawyerDashboard()));
      }
    }
  } */
}

Map<int, Color> color = {
  50: Color.fromRGBO(255, 92, 87, .1),
  100: Color.fromRGBO(255, 92, 87, .2),
  200: Color.fromRGBO(255, 92, 87, .3),
  300: Color.fromRGBO(255, 92, 87, .4),
  400: Color.fromRGBO(255, 92, 87, .5),
  500: Color.fromRGBO(255, 92, 87, .6),
  600: Color.fromRGBO(255, 92, 87, .7),
  700: Color.fromRGBO(255, 92, 87, .8),
  800: Color.fromRGBO(255, 92, 87, .9),
  900: Color.fromRGBO(255, 92, 87, 1),
};

MaterialColor colorCustom = MaterialColor(0xFFd1a545, color);

