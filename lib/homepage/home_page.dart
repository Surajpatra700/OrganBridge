import 'package:flutter/material.dart';
import 'package:organ_bridge_project/homepage/display_card.dart';
import 'package:organ_bridge_project/homepage/donation.dart';
import 'package:organ_bridge_project/homepage/home_page_card.dart';
import 'package:organ_bridge_project/homepage/home_page_drawer.dart';
import 'package:organ_bridge_project/homepage/home_stack.dart';
import 'package:velocity_x/velocity_x.dart';

// import 'HomePageUtils/display_card.dart';
// import 'HomePageUtils/donation.dart';
// import 'HomePageUtils/home_page_card.dart';
// import 'HomePageUtils/home_page_drawer.dart';
// import 'HomePageUtils/home_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldState,
        drawer: HomePageDrawer(),
        backgroundColor: Colors.indigo.shade50,
        body: SingleChildScrollView(
          child: Column(
            children: [
              HomeStack(scaffoldState: _scaffoldState),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      DisplayCard(
                        number: '64',
                        title: 'Donors',
                        subtitle: 'have joined us',
                      ),
                      DisplayCard(
                        number: '148',
                        title: 'Requestor',
                        subtitle: 'have been helped',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  const FeedCard(
                    title: "Health is Wealth",
                    imageUrl: "https://unsplash.it/300/300",
                    content:
                        "Health is crucial for leading a fulfilling life as it allows us to engage in physical, social and occupational activities. Maintaining good health also helps prevent chronic diseases and improves overall quality of life.",
                  ),
                  const FeedCard(
                    title: "Organ Donation",
                    imageUrl: "https://unsplash.it/200/200",
                    content:
                        "Many lives could be saved and significant deaths could be avoided if organ donation is done at the right time. Organ donation is a social act and it can be done by a living donor or a person who is brain dead.",
                  ),
                  const DonationCard(),
                  const SizedBox(
                    height: 36,
                  ),
                  Container(
                    height: 2,
                    width: double.infinity,
                    color: Colors.indigo.shade100,
                  ).px12(),
                  const SizedBox(
                    height: 12,
                  ),
                  "© Copyrights OrganBridge Pvt. Ltd."
                      .text
                      .center
                      .color(Colors.black)
                      .make()
                      .opacity(value: 0.5)
                ],
              ).px16(),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}