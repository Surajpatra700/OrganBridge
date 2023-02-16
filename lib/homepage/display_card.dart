import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DisplayCard extends StatelessWidget {
  final String number;
  final String title;
  final String subtitle;

  const DisplayCard({
    Key? key,
    required this.number,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            children: [
              number.text.xl6.bold.color(Colors.indigo.shade300).make(),
              title.text.xl3.bold.make(),
              subtitle.text.medium.center.make().opacity(value: 0.5),
            ],
          ),
        ).p16(),
      ),
    );
  }
}