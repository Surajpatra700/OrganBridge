import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class About extends StatelessWidget {
  const About ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.indigo,
        title: "About Us".text.light.white.make(),
      ),
body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              //color: Colors.indigo.shade200,
              child: Container(
                width: double.infinity,
               // color: Colors.indigo.shade50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     "Welcome To Our Organ Donation App".text.xl2.bold.make().pOnly(bottom: 16),
                      "  With this app, you can register to become an organ donor, learn about the process, and find out more about the people who have already donated.Organ donation is a selfless act of generosity that can save a person's life. Unfortunately, the need for organs greatly exceeds the number of available donors. Our app was created to help bridge this gap and give everyone a chance to make a difference. The app is easy to use and provides access to helpful resources such as information about organ donation, ways to register as a donor, and stories of people who have already donated and the lives they have saved.We hope our app can make the process of organ donation easier and more accessible for everyone. We want to thank you for your support and for considering becoming an organ donor. Every organ donor makes a difference.."
                        .text
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                        SizedBox(
                          height: 30,
                        ),
                    "Developed by"
                        .text.bold
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                  "Hack Elites"
                        .text
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                        SizedBox(
                          height: 30,
                        ),
                    "Developers:"
                        .text.bold
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                        "Suraj Patra"
                        .text
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                        "Jahnavi Lenka"
                        .text
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                        "Purnamita Baral"
                        .text
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                        "Kalinga Kumar Khatua"
                        .text
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                  ],
                ).px8().py16(),
              ).px32(),
            ),
            const SizedBox(
              height: 20,
            ),
          ]
      ))
    );
  }
}