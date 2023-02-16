import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../actions/forgot_password.dart';
import '../actions/form_field_mine.dart';
import '../actions/round_button.dart';
import '../actions/utils.dart';
import '../actions/utils_2.dart';
import '../forms/donor_formpage.dart';
import 'signup_screen.dart';

class DonorLoginScreen extends StatefulWidget {
  const DonorLoginScreen({super.key});

  @override
  State<DonorLoginScreen> createState() => _DonorLoginScreenState();
}

class _DonorLoginScreenState extends State<DonorLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  void login() {
    // When login button is pressed then loading = true i.e it will show circular progress indicator
    if (_formKey.currentState!.validate()) {
      setState(() {
        loading = true;
      });
      auth
          .signInWithEmailAndPassword(
              email: emailController.text.toString(),
              password: passwordController.text.toString())
          .then((value) {
        Utilss().toastMessage("Succesfully Login");
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => DonorFormPage())));
        setState(() {
          loading = false;
        });
      }).onError((error, stackTrace) {
        //debugPrint(error.toString());
        Utils().toastMessage(error.toString());
        setState(() {
          loading = false;
        }); // After navigation and on getting an error we don't want the circular progress indicator hence we have set the loading as false.
      });
    } else {
      Utils().toastMessage("Invalid username or password");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/sign_up_bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 172,
                    ),
                    "OrganBridge"
                        .text
                        .bold
                        .white
                        .xl
                        .make()
                        .opacity(value: 0.50),
                    SizedBox(
                      height: 16,
                    ),
                    "Donor Login Page".text.white.bold.xl4.make(),
                    SizedBox(
                      height: 40,
                    ),
                    FormFieldMine(
                      controller: emailController,
                      text: "Enter your email",
                      icon: CupertinoIcons.mail,
                      returnText: "Enter Email",
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                    ).px20(),
                    SizedBox(
                      height: 16,
                    ),
                    FormFieldMine(
                      controller: passwordController,
                      text: "Enter your password",
                      icon: CupertinoIcons.padlock,
                      returnText: "Enter Password",
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ).px20(),
                    SizedBox(
                      height: 40,
                    ),
                    RoundButton(
                      loading: loading,
                      title: "Login",
                      onTap: () {
                        login();
                      },
                    ).px20(),
                    SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => ForgetPassword()),
                            ),
                          );
                        },
                        child: "Forgot password?"
                            .text
                            .white
                            .lg
                            .color(Colors.indigo.shade900)
                            .make()
                            .opacity(value: 0.75),
                      ),
                    ).pOnly(left: 20),
                    Row(
                      children: [
                        "Don't have an account?"
                            .text
                            .lg
                            .white
                            .make()
                            .opacity(value: 0.75),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: ((context) => SignUpScreen()),
                              ),
                            );
                          },
                          child: "SignUp".text.lg.bold.white.make(),
                        ),
                      ],
                    ).pOnly(left: 28),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
