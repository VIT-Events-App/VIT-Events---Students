import 'package:flutter/material.dart';
import 'dart:async';

import 'package:students/Screens/home.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    super.initState();
    new Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            ));
  }

  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage("assets/logo2.jpeg"),
              fit: BoxFit.fitWidth,
            )));
  }
}
