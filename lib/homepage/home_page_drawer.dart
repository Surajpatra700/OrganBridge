import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organ_bridge_project/actions/utils.dart';
import 'package:organ_bridge_project/homepage/home_page.dart';
import 'package:organ_bridge_project/screens/add_info.dart';
import 'package:organ_bridge_project/screens/quote_page.dart';
import 'package:organ_bridge_project/screens/signup_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePageDrawer extends StatelessWidget {
  final auth = FirebaseAuth.instance;
  final url = Uri.parse("https://sotto.mp.gov.in/");

  @override
  Widget build(BuildContext context) {
    const imageUrl = "https://unsplash.it/200/200";
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(
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
                // color: Colors.indigo.shade700,
              ),
              margin: EdgeInsets.zero,
              //auth.currentUser!.email!.text.bold.xl2.make()
              accountName: auth.currentUser!.email!.text.bold.xl2.make(),
              accountEmail: "9767812672".text.make(),
              currentAccountPicture: const CircleAvatar(
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomePage())));
            },
            leading: Icon(Icons.home),
            title: Text("Home",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
            //subtitle: "Subdetails".text.make(),
          ),
          ListTile(
            onTap: () async {
              await launchUrl(url);
            },
            leading: Icon(Icons.language),
            title: Text("Website",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: ((context) => About())));
            },
            leading: Icon(Icons.info),
            title: Text("About us",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500)),
          ),
          const SizedBox(
            height: 24,
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.arrow_left_to_line,
              color: Colors.indigo.shade300,
            ),
            title: "Logout".text.lg.color(Colors.indigo.shade300).make(),
            onTap: () {
              //final store = auth.currentUser!.email;
              auth.signOut().then((value) {
                Utils().toastMessage("Signed Out");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => const SignUpScreen())));
              }).onError((error, stackTrace) {
                Utils().toastMessage(error.toString());
              });
            },
            tileColor: Colors.indigo.shade50,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                  Colors.indigo.shade100,
                  Color.fromARGB(255, 100, 135, 164),
                ])),
            child: ListTile(
              leading: Icon(Icons.thumb_up_rounded),
              title: Text("Quotes"),
              subtitle: Text("There will be a sunshine"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => QuotesScreen())));
              },
            ),
          ),
        ],
      ),
    );
  }
}
