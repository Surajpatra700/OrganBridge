import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:organ_bridge_project/actions/splashservices.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final splashScreen = SplashServices();
  @override
  void initState() {
    super.initState();
    splashScreen.display(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
        child: Center(
          child: AnimatedTextKit(
            pause: Duration(seconds: 1),
            animatedTexts: [
              ColorizeAnimatedText("OrganBridge",
                  speed: Duration(seconds: 1),
                  textStyle: TextStyle(
                      fontSize: 48,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.bold),
                  colors: [
                    Colors.blue,
                    Colors.green.shade600,
                    Colors.yellow,
                    Colors.red,
                  ]),
            ],
            isRepeatingAnimation: false,
            repeatForever: false,
          ),
        ),
      ),
    );
  }
}
