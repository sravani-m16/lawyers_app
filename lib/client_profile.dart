import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ClientProfile extends StatefulWidget{

  @override
  _ClientProfileState createState() => _ClientProfileState();

}

class _ClientProfileState  extends State<ClientProfile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: Center(
        child: Text("This is Client profile"),
      ),
    );
  }
}