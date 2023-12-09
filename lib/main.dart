

import 'package:flutter/material.dart';
import 'package:tractittt/login.dart';
import 'package:tractittt/signup.dart';
import 'package:tractittt/splashscreen.dart';
import 'package:tractittt/userportal.dart';

import 'First.dart';
import 'PrintedFormScreen.dart';
import 'adminscanner.dart';
import 'applicationform.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: {
      'First': (context) => MyFirst(),
      'signup': (context) => SignUp(),
      'login': (context) => MyLogin(),
      'applicationform': (context) => MyForm(),
      'userportal': (context) => UserPortal(),
      'adminscanner':(context)=> AdminScannerScreen(),
    },
  ));
}
