// ignore_for_file: prefer_const_constructors

import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:organ_bridge_project/actions/utils.dart';
import 'package:organ_bridge_project/actions/utils_2.dart';
import 'package:organ_bridge_project/homepage/home_page.dart';

import '../actions/round_button.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final auth = FirebaseAuth.instance;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.indigo.shade200,
                  Color.fromARGB(255, 101, 61, 171),
                ])),
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 170,
                  ),
                  const Center(
                      child: Text(
                    "OrganBridge",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )),
                  const SizedBox(
                    height: 15,
                  ),
                  const Center(
                    child: Text(
                      "Welcome to SignUp Page",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: "User email",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          CupertinoIcons.mail_solid,
                          color: Colors.white60,
                        ),
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
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          CupertinoIcons.lock_fill,
                          color: Colors.white60,
                        ),
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
                  const SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: RoundButton(
                        loading: loading,
                        title: "Sign Up",
                        onTap: () {
                          loading = loading;
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              loading = true;
                            });
                            auth
                                .createUserWithEmailAndPassword(
                              email: emailController.text.toString(),
                              password: passwordController.text.toString(),
                            )
                                .then((value) {
                              setState(() {
                                loading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                              Utilss().toastMessage("Successfully SignedUp");
                            }).onError((error, stackTrace) {
                              setState(() {
                                loading = false;
                              });
                              Utils().toastMessage(error.toString());
                            });
                          }
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "Already have an account",
                          style:
                              TextStyle(fontSize: 14.5, color: Colors.black87),
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "login",
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
        ],
      ),
    );
  }
}
