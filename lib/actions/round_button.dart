// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
//import 'dart:ui';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final bool loading;
  //final Color color;
  const RoundButton(
      {super.key,
      required this.title,
      required this.onTap,
      //required this.color,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.0),
        child: Container(
            height: 50,
            //width: double.infinity,
            decoration: BoxDecoration(
              //color: color,
              gradient: LinearGradient(colors: const [
                Color(0xFF471A91),
                Color(0xff3cabff),
              ]),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: loading
                  ? CircularProgressIndicator(
                      color: Colors.white, strokeWidth: 4)
                  : title.text.xl.bold.white.make(),
            )),
      ),
    );
  }
}