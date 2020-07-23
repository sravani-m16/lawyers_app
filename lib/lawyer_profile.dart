import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LawyerProfile extends StatefulWidget{
  
  @override
  _LawyerProfileState createState() => _LawyerProfileState();
  
}

class _LawyerProfileState  extends State<LawyerProfile>{

  TextStyle style = TextStyle(fontFamily: 'Script MT Bold', fontWeight: FontWeight.bold, fontSize: 20.0, color: Color(0xFFd1a545));

  TextStyle style2 = TextStyle(fontFamily: 'Colus', fontSize: 20.0, color: Color(0xFFaa7f21));

  TextStyle style3 = TextStyle(fontFamily: 'Script MT Bold', fontSize: 20.0, color: Color(0xFFd1a545));

  TextEditingController _name, _mobile, _website, _address, _practicingCity, _area,
      _pin, _specialization, _experience, _courts, _lang,
      _licenseNo,  _phoneFees, _emailFees, _education, _chatFees;

  SharedPreferences prefs;

  String name ='', mobile ='', website ='', address ='', practicingCity ='', area ='',
      pin ='', specialization ='', experience ='', courts ='', lang ='',
      licenseNo ='',  phoneFees ='', emailFees ='', education ='', chatFees ='';

  bool isLoading = false;

  final FocusNode focusNodeName = FocusNode();
  final FocusNode focusNodeMobile = FocusNode();
  final FocusNode focusNodeWeb = FocusNode();
  final FocusNode focusNodeAddress = FocusNode();
  final FocusNode focusNodeArea = FocusNode();
  final FocusNode focusNodeCity = FocusNode();
  final FocusNode focusNodePin = FocusNode();
  final FocusNode focusNodeSpec = FocusNode();
  final FocusNode focusNodeExp = FocusNode();
  final FocusNode focusNodeCourts = FocusNode();
  final FocusNode focusNodeLang = FocusNode();
  final FocusNode focusNodeLic = FocusNode();
  final FocusNode focusNodeEdu = FocusNode();
  final FocusNode focusNodePhoneFees = FocusNode();
  final FocusNode focusNodeEmailFees = FocusNode();
  final FocusNode focusNodeChatFees = FocusNode();

  @override
  void initState() {
    super.initState();
    readLocal();
  }

  void readLocal() async {
    prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    mobile = prefs.getString('mobile') ?? '';
    address = prefs.getString('address') ?? '';
    area = prefs.getString('area') ?? '';
    practicingCity = prefs.getString('city') ?? '';
    education = prefs.getString('education details') ?? '';
    specialization = prefs.getString('specialization') ?? '';
    courts = prefs.getString('courts',) ?? '';
    website = prefs.getString('website') ?? '';
    lang = prefs.getString('languages known') ?? '';
    licenseNo = prefs.getString('license number') ?? '';
    experience = prefs.getString('experience') ?? '';
    pin = prefs.getString('pin') ?? '';
    emailFees = prefs.getString('email fees') ?? '';
    phoneFees = prefs.getString('phone fees') ?? '';
    chatFees = prefs.getString('chat fees') ?? '';
    //aboutMe = prefs.getString('aboutMe') ?? '';
   // photoUrl = prefs.getString('photoUrl') ?? '';

    _name = TextEditingController(text: name);
    _mobile = TextEditingController(text: mobile);
    _address = TextEditingController(text: address);
    _area = TextEditingController(text: area);
    _practicingCity = TextEditingController(text: practicingCity);
    _pin = TextEditingController(text: pin);
    _education = TextEditingController(text: education);
    _specialization = TextEditingController(text: specialization);
    _experience = TextEditingController(text: experience);
    _courts = TextEditingController(text: courts);
    _lang = TextEditingController(text: lang);
    _licenseNo = TextEditingController(text: licenseNo);
    _website = TextEditingController(text: website);
    _phoneFees = TextEditingController(text: phoneFees);
    _chatFees = TextEditingController(text: chatFees);
    _emailFees = TextEditingController(text: emailFees);


    // Force refresh input
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
      children: <Widget>[

              //getName(),
              //getMobile(),

              // Input
              Column(
                children: <Widget>[
                  // Username
                  Container(
                    child: Text(
                      'Name',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, bottom: 5.0, top: 10.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Sweetie',
                          contentPadding: EdgeInsets.all(5.0),
                          hintStyle: TextStyle(),
                        ),
                        controller: _name,
                        onChanged: (value) {
                          name = value;
                        },
                        focusNode: focusNodeName,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

                  // Mobile
                  Container(
                    child: Text(
                      'Mobile',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '9687456321',
                          contentPadding: EdgeInsets.all(5.0),
                         // hintStyle: TextStyle(),
                        ),
                        controller: _mobile,
                        onChanged: (value) {
                          mobile = value;
                        },
                        focusNode: focusNodeMobile,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

              //Address

                  Container(
                    child: Text(
                      'Address',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Street',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _address,
                        onChanged: (value) {
                          address = value;
                        },
                        focusNode: focusNodeAddress,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

              //Area
                  Container(
                    child: Text(
                      'Area',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Street',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _area,
                        onChanged: (value) {
                          area = value;
                        },
                        focusNode: focusNodeArea,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

              //City

                  Container(
                    child: Text(
                      'City',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'City',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _practicingCity,
                        onChanged: (value) {
                          practicingCity = value;
                        },
                        focusNode: focusNodeCity,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

              //Pin

                  Container(
                    child: Text(
                      'Pin',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Pin',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _pin,
                        onChanged: (value) {
                          pin = value;
                        },
                        focusNode: focusNodePin,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

               //Education
                  Container(
                    child: Text(
                      'Education',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'LLB',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _education,
                        onChanged: (value) {
                          education = value;
                        },
                        focusNode: focusNodeEdu,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

               //Specialization

                  Container(
                    child: Text(
                      'Specialization',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Civil',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _specialization,
                        onChanged: (value) {
                          specialization = value;
                        },
                        focusNode: focusNodeSpec,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

               //Experience

                  Container(
                    child: Text(
                      'Experience',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '5',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _experience,
                        onChanged: (value) {
                          experience = value;
                        },
                        focusNode: focusNodeExp,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

               //Licensce
                  Container(
                    child: Text(
                      'License',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'License Number',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _licenseNo,
                        onChanged: (value) {
                          licenseNo = value;
                        },
                        focusNode: focusNodeLic,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

               //Languages

                  Container(
                    child: Text(
                      'Languages Known',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Hindi',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _lang,
                        onChanged: (value) {
                          lang = value;
                        },
                        focusNode: focusNodeLang,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

              //Phone Fees

                  Container(
                    child: Text(
                      'Phone Fees',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '200',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _phoneFees,
                        onChanged: (value) {
                          phoneFees = value;
                        },
                        focusNode: focusNodePhoneFees,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

                  //Email Fees

                  Container(
                    child: Text(
                      'Email Fees',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '200',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _emailFees,
                        onChanged: (value) {
                          emailFees = value;
                        },
                        focusNode: focusNodeEmailFees,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

                  //Chat Fees

                  Container(
                    child: Text(
                      'Chat Fees',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '200',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _chatFees,
                        onChanged: (value) {
                          chatFees = value;
                        },
                        focusNode: focusNodeChatFees,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),


               //Courts

                  Container(
                    child: Text(
                      'Practicing Courts',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Supreme',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _courts,
                        onChanged: (value) {
                          courts = value;
                        },
                        focusNode: focusNodeCourts,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

                  //Webite

                  Container(
                    child: Text(
                      'Website',
                      style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                    ),
                    margin: EdgeInsets.only(left: 10.0, top: 30.0, bottom: 5.0),
                  ),
                  Container(
                    child: Theme(
                      data: Theme.of(context).copyWith(),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'www.example.com',
                          contentPadding: EdgeInsets.all(5.0),
                          // hintStyle: TextStyle(),
                        ),
                        controller: _website,
                        onChanged: (value) {
                          website = value;
                        },
                        focusNode: focusNodeWeb,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 30.0, right: 30.0),
                  ),

                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),



              // Button
              Container(
                child: FlatButton(
                  onPressed: handleUpdateData,
                  child: Text(
                    'UPDATE',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  color: Color(0xff203152),
                  highlightColor: Color(0xff8d93a0),
                  splashColor: Colors.transparent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                ),
                margin: EdgeInsets.only(top: 50.0, bottom: 50.0),
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
              ),

            ],
          ),
      ),

        );

        // Loading
       /* Positioned(
          child: isLoading
              ? Container(
            child: Center(
              child: CircularProgressIndicator(
            ),
            ),
            color: Colors.white.withOpacity(0.8),
          )
              : Container(),
        ),
      ],
    ),
    );*/
  }

  void handleUpdateData() {
    focusNodeName.unfocus();
    focusNodeMobile.unfocus();
    focusNodeWeb.unfocus();
    focusNodeAddress.unfocus();
    focusNodeArea.unfocus();
    focusNodeEmailFees.unfocus();
    focusNodePhoneFees.unfocus();
    focusNodeChatFees.unfocus();
    focusNodeEdu.unfocus();
    focusNodeExp.unfocus();
    focusNodeLang.unfocus();
    focusNodeLic.unfocus();
    focusNodeSpec.unfocus();
    focusNodeCourts.unfocus();
    focusNodeCity.unfocus();
    focusNodePin.unfocus();

    setState(() {
      isLoading = true;
    });

    Firestore.instance
        .collection('Lawyers')
        .document()
        .updateData({'name': name, 'mobile': mobile, 'address': address, 'area': area,
      'city' : practicingCity, 'pin' : pin, 'education details': education, 'experience' : experience,
    'specialization' : specialization, 'practicing courts': courts, 'languages known': lang,
    'license number': licenseNo, 'phone fees': phoneFees, 'chat fees': chatFees, 'email fees': emailFees, 'website': website}).then((data) async {

      await prefs.setString('name', name);
      await prefs.setString('mobile', mobile);
      await prefs.setString('address', address);
      await prefs.setString('area', area);
      await prefs.setString('city', practicingCity);
      await prefs.setString('pin', pin);
      await prefs.setString('education details', education);
      await prefs.setString('specialization', specialization);
      await prefs.setString('experience', experience);
      await prefs.setString('courts', courts);
      await prefs.setString('languages known', lang);
      await prefs.setString('license number', licenseNo);
      await prefs.setString('phone fees', phoneFees);
      await prefs.setString('email fees', emailFees);
      await prefs.setString('chat fees', chatFees);
      await prefs.setString('website', website);


      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: "Update success");
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });

      Fluttertoast.showToast(msg: err.toString());
    });
  }

}

