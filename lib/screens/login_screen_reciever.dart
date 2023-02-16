// ignore_for_file: prefer_const_constructors, unused_import, avoid_unnecessary_containers

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:organ_bridge_project/actions/utils.dart';
import 'package:organ_bridge_project/actions/utils_2.dart';
import 'package:organ_bridge_project/screens/signup_screen.dart';

import '../actions/round_button.dart';
import '../forms/requestor_formpage.dart';


class RequestorLoginScreen extends StatefulWidget {
  const RequestorLoginScreen({super.key});

  @override
  State<RequestorLoginScreen> createState() => _RequestorLoginScreenState();
}

class _RequestorLoginScreenState extends State<RequestorLoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  void login() {
    // When login button is pressed then loading = true i.e it will show circular progress indicator
    setState(() {
      loading = true;
    });
    auth
        .signInWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      Utilss().toastMessage("Succesfully Login");
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => RequestorFormPage())));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      }); // After navigation and on getting an error we don't want the circular progress indicator hence we have set the loading as false.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://wallpaperaccess.com/full/5361112.jpg"),
                fit: BoxFit.cover),
          ),
          child: Container(
            //color: Colors.transparent,
            child: Form(
              key: _formKey,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 170,
                  ),
                  Center(
                      child: Text(
                    "OrganBridge",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                      child: Text(
                    "Requestor Login Page",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  )),
                  SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        labelText: "username",
                        hintText: "User email",
                        prefixIcon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter email";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "password",
                        hintText: "password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter password";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RoundButton(
                        //color: Colors.deepPurple,
                        loading: loading,
                        title: "Login",
                        onTap: () {
                          login();
                          // if (_formKey.currentState!.validate()) {
                          //   setState(() {
                          //     loading = true;
                          //   });
                          //   auth
                          //       .signInWithEmailAndPassword(
                          //     email: emailController.text.toString(),
                          //     password: passwordController.text.toString(),
                          //   )
                          //       .then((value) {
                          //         setState(() {
                          //     loading = false;
                          //   });
                          //     Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (content) => PostScreen()));
                          //     Utils().toastMessage("Succesfully Login");
                          //   }).onError((error, stackTrace) {
                          //     Utils().toastMessage(error.toString());
                          //     setState(() {
                          //     loading = false;
                          //   });
                          //   });
                          // }
                        }),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                          onPressed: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => ForgetPassword()));
                          },
                          child: Text(
                            "forgot password?",
                            style: TextStyle(
                                color: Colors.deepPurple, fontSize: 16),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Don't have an account",
                          style:
                              TextStyle(fontSize: 14.5, color: Colors.black87),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => SignUpScreen())));
                          },
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 210,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}