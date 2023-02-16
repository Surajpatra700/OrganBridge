import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organ_bridge_project/homepage/home_page.dart';
import 'package:organ_bridge_project/screens/signup_screen.dart';
//import 'package:organ_bridge/pages/homepage.dart';
final auth = FirebaseAuth.instance;
final user = auth.currentUser;

class SplashServices {

  void display(BuildContext context) {
    if(user == null){
      Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignUpScreen())));
    }else{
      Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())));
    }
  }
}
