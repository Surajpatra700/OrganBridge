import 'package:flutter/material.dart';

class RaisedButton extends StatelessWidget {
  //final MaterialColor color;
  final Text child;
  final Null Function() onPressed;
  const RaisedButton({super.key,required this.child,required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        child: Center(child: child),
        //color: color,
        height: 50,
        width: 140,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.deepPurple,
            Colors.indigo.shade600,
            Colors.blue,
          ]),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}