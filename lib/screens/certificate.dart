import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organ_bridge_project/homepage/home_page.dart';
import 'package:velocity_x/velocity_x.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.1,
        title: "Thank You".text.light.italic.black.make(),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomePage())));
            },
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.indigo.shade200,
              child: Container(
                width: double.infinity,
                color: Colors.indigo.shade50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Dear Donor,".text.xl2.bold.make().pOnly(bottom: 16),
                    "We, the OrganBridge, are honored to present this certificate of appreciation to you in recognition of your selfless act of donating your organs. Your generosity has not only saved lives but also brought hope and a brighter future to countless individuals and their families."
                        .text
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                    "Your kind act of kindness will never be forgotten and will always serve as an inspiration to others. Your unwavering commitment to improving the lives of others is a testament to your compassion and empathy."
                        .text
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                    "Thank you for your generosity and for giving the gift of life to those in need. You truly are a hero in every sense of the word."
                        .text
                        .lg
                        .gray600
                        .make()
                        .pOnly(bottom: 8),
                    "Signed,".text.lg.gray600.make().pOnly(top: 36),
                    "[OrganBridge Pvt. Ltd.]".text.italic.lg.gray600.make(),
                  ],
                ).px8().py16(),
              ).px32(),
            ),
            const SizedBox(
              height: 20,
            ),
            "Download your certificate here".text.lg.make(),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton.icon(
                icon: const Icon(CupertinoIcons.cloud_download),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo.shade400,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                ),
                onPressed: () {},
                label: "Save to device".text.lg.bold.make())
          ],
        ),
      ),
    );
  }
}
