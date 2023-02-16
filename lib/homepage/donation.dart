// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:organ_bridge_project/screens/donation_screen.dart';
import 'package:velocity_x/velocity_x.dart';

//import 'number_input_form.dart';

class DonationCard extends StatelessWidget {
  const DonationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.currency_rupee,
                size: 35,
                color: Colors.indigo.shade600,
              ),
              SizedBox(width: 20),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  width: 200,
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: ((context) => DonationScreen())));
                      },
                      child: Center(
                          child: Text(
                        "Donate",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ))),
                  decoration: BoxDecoration(
                      //border: Border.all(),
                      borderRadius: BorderRadius.circular(20),
                      //color: Colors.indigo.shade700,
                      gradient: LinearGradient(colors: [
                        Colors.deepPurple,
                        Colors.indigo.shade600,
                        Colors.blue,
                      ])),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          "No act of kindness, no matter how small, is ever wasted. Your donation can create a ripple of positivity in the lives of many. DONATE NOW."
              .text
              .make()
              .opacity(value: 0.7),
        ],
      ).p16(),
    );
  }
}