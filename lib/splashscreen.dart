import 'dart:async';


import 'package:flutter/material.dart';
import 'package:tractittt/login.dart';

import 'First.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyLogin(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade900,
      body: Container(


        child: Padding(
            padding: EdgeInsets.only(left: 75),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.only(top: 300, right: 55),
                  child: Text("TRACK-IT",style: TextStyle(fontSize: 50,color: Colors.white,fontWeight:FontWeight.w800),),
                ),
                Padding(
                  padding:  EdgeInsets.only(right: 50),
                  child: Text("Barcode based Application Tracking ", style: TextStyle(fontSize: 15,color: Colors.white),),
                ),

              ],
            )),
      ),

    );
  }
}