import 'package:flutter/material.dart';
import 'package:organ_bridge_project/actions/raised_button.dart';
import 'package:organ_bridge_project/homepage/home_page.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  late Razorpay razorpay;
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay.clear();
  }

  void openCheckOut() {
    var options = {
      "key": "rzp_test_l36tJwpUWdiTUO",
      "amount": num.parse(textEditingController.text) * 100,
      "name": "Donation Page",
      "description": "Donation for OrganBridge",
      "prefill": {
        "contact": "7751011013",
        "email": "patrasuraj1000@gmail.com",
      },
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  void handlerPaymentSuccess() {
    print("Payment Success");
    Toast.show("Payment sucess", textStyle: context);
  }

  void handlerErrorFailure() {
    print("Payment error");
    Toast.show("Payment error", textStyle: context);
  }

  void handlerExternalWallet() {
    print("External Wallet");
    Toast.show("External Wallet", textStyle: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Donation"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: ((context) => HomePage())));
                },
                icon: Icon(Icons.home, color: Colors.grey.shade300, size: 26)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Center(
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/donate.jpg"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              TextField(
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                controller: textEditingController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.currency_rupee),
                  hintText: "Amount to donate",
                  hintStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black54,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 25),
              RaisedButton(
                child: Text(
                  "Donate Now",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  openCheckOut();
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
} 
