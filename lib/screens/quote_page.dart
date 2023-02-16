import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:organ_bridge_project/homepage/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class QuotesScreen extends StatelessWidget {
  const QuotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quotesList = [
      "Health is a state of complete physical, mental and social well-being, and not merely the absence of disease or infirmity.",
      "The art of medicine consists of amusing the patient while nature cures the disease.",
      "No society can legitimately call itself civilized if a sick person is denied medical aid because of lack of means.",
      "Health is not valued till sickness comes.",
      "Preventive care is not just smarter medicine, it's better value for the money.",
      "Health is a human right, not a privilege.",
      "The best medicine is the one you don't have to take.",
      "The only way to keep your health is to eat what you don't want, drink what you don't like, and do what you'd rather not.",
      "Take care of your body. It's the only place you have to live.",
      "The greatest wealth is health.",
    ];

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage("https://unsplash.it/900/1600"),
                fit: BoxFit.cover,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.25),
                  ),
                ),
              ]),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: ((context) => HomePage()),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: Colors.indigo.shade700,
            ),
          ).pOnly(top: 30),
          QuoteText(quotesList: quotesList).px64(),
        ],
      ),
    );
  }
}

class QuoteText extends StatefulWidget {
  const QuoteText({
    Key? key,
    required this.quotesList,
  }) : super(key: key);

  final List<String> quotesList;

  @override
  State<QuoteText> createState() => _QuoteTextState();
}

class _QuoteTextState extends State<QuoteText> {
  @override
  void initState() {
    super.initState();
    setState(() {
      Timer.periodic(const Duration(seconds: 5), (Timer t) => setState(() {}));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: widget.quotesList[Random().nextInt(widget.quotesList.length)].text
          .white.bold.italic.center.lg
          .make(),
    );
  }
}
