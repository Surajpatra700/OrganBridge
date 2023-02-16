// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organ_bridge_project/homepage/login_button.dart';
import 'package:organ_bridge_project/screens/login_screen_donor.dart';
import 'package:organ_bridge_project/screens/login_screen_reciever.dart';
import 'package:velocity_x/velocity_x.dart';

//import 'login_button.dart';

class HomeStack extends StatelessWidget {
  HomeStack({
    Key? key,
    required GlobalKey<ScaffoldState> scaffoldState,
  })  : _scaffoldState = scaffoldState,
        super(key: key);

  final GlobalKey<ScaffoldState> _scaffoldState;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.indigo.shade300,
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    stops: const [
                      0.2,
                      1.0
                      // 0.4,
                      // 0.4
                    ],
                    colors: [
                      Colors.indigo.shade300,
                      const Color.fromARGB(255, 37, 42, 96),
                    ]),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(32),
                ),
              ),
              child: Center(
                child: "OrganBridge".text.xl5.extraBlack.white.make().py64(),
              ),
            ),
            Container(
              height: 140,
            )
          ],
        ),
        Positioned.fill(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LoginButton(
                      onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => DonorLoginScreen())));
                      },
                      icon: CupertinoIcons.person,
                      textInside: "Login as Donor"),
                  SizedBox(
                    height: 12,
                  ),
                  LoginButton(
                      onTap: () {
                        Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => RequestorLoginScreen())));
                      },
                      icon: CupertinoIcons.person_solid,
                      textInside: "Login as Requestor"),
                ],
              ).px32().py24(),
            ),
          ),
        ),
        Positioned(
          left: 8,
          top: 12,
          child: IconButton(
            icon: const Icon(Icons.menu_rounded, color: Colors.white),
            onPressed: () => _scaffoldState.currentState?.openDrawer(),
          ),
        ),
      ],
    );
  }
}