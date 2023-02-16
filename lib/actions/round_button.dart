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
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.indigo.shade700,
          // gradient: LinearGradient(colors: [
          //   Colors.indigo.shade700,
          //   Colors.indigo.shade300,
          // ]),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(color: Colors.white, strokeWidth: 4)
              : title.text.xl.bold.white.make(),
        ).py12(),
      ),
    );
  }
}
