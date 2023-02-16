import 'dart:async';

import 'package:flutter/material.dart';
import 'package:organ_bridge_project/homepage/home_page.dart';
//import 'package:organ_bridge/pages/homepage.dart';

class SplashServices {
  void display(BuildContext context) {
    
    Timer(
        const Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }
}
