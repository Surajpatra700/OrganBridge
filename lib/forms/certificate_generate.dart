// ignore_for_file: prefer_const_constructors

//import 'package:flutter/cupertino.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:organ_bridge_project/actions/round_button.dart';
import 'package:organ_bridge_project/actions/utils.dart';
import 'package:organ_bridge_project/actions/utils_2.dart';
import 'package:organ_bridge_project/screens/certificate.dart';

class CertificateGenerate extends StatefulWidget {
  const CertificateGenerate({super.key});

  @override
  State<CertificateGenerate> createState() => _CertificateGenerateState();
}

class _CertificateGenerateState extends State<CertificateGenerate> {
  //List specification = ['Name','Organ Donated','Date','Hospital Admitted','Security Key'];
  final database = FirebaseDatabase.instance.ref("certificate");
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final organController = TextEditingController();
  final dateController = TextEditingController();
  final hospitalController = TextEditingController();
  final securityController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
            Color.fromARGB(255, 42, 25, 71),
            Colors.indigo.shade200,
          ])
          // image: DecorationImage(
          //     image: AssetImage("assets/images/back.jpg"), fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            height: 580,
            width: 320,
            //color: Colors.blue,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade700),
              borderRadius: BorderRadius.circular(25),
              color: Colors.transparent,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Text(
                        "Certificate Details",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(height: 40),
                    //for (int i = 0; i < 5;i++)
                    //if()
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Name",
                          labelText: "Name",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "enter name";
                          } else {
                            return null;
                          }
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: organController,
                        decoration: InputDecoration(
                          hintText: "Organ Donated",
                          labelText: "Organ Donated",
                          prefixIcon: Icon(Icons.person),
                          border: OutlineInputBorder(),
                          suffixIcon: PopupMenuButton(
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.black),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: 1,
                                      child: Text("Heart"),
                                      onTap: () {
                                        setState(() {
                                          organController.text = "Heart";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 2,
                                      child: Text("Kidney"),
                                      onTap: () {
                                        setState(() {
                                          organController.text = "Kidney";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 3,
                                      child: Text("intestine"),
                                      onTap: () {
                                        setState(() {
                                          organController.text = "intestine";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 4,
                                      child: Text("Bone Marrow"),
                                      onTap: () {
                                        setState(() {
                                          organController.text = "Bone Marrow";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 5,
                                      child: Text("Eyes"),
                                      onTap: () {
                                        setState(() {
                                          organController.text = "Eyes";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 6,
                                      child: Text("Skin"),
                                      onTap: () {
                                        setState(() {
                                          organController.text = "Skin";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 7,
                                      child: Text("Pancreas"),
                                      onTap: () {
                                        setState(() {
                                          organController.text = "Pancreas";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 8,
                                      child: Text("Liver"),
                                      onTap: () {
                                        setState(() {
                                          organController.text = "Liver";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 9,
                                      child: Text("Lungs"),
                                      onTap: () {
                                        setState(() {
                                          organController.text = "Lungs";
                                        });
                                      },
                                    ),
                                  ]),
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "enter your donated organ";
                          } else {
                            return null;
                          }
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: dateController,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now());
                          if (pickedDate != null) {
                            setState(() {
                              dateController.text = pickedDate.toString();
                            });
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintText: "yyyy-mm-dd",
                          labelText: "Date",
                          prefixIcon: Icon(Icons.calendar_today),
                          border: OutlineInputBorder(),
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "enter date";
                          } else {
                            return null;
                          }
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: hospitalController,
                        decoration: InputDecoration(
                          hintText: "Hospital Name",
                          labelText: "Hospital Name",
                          prefixIcon: Icon(Icons.local_hospital),
                          border: OutlineInputBorder(),
                          suffixIcon: PopupMenuButton(
                              icon: Icon(Icons.arrow_drop_down,
                                  color: Colors.black),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      value: 1,
                                      child: Text("AIIMS,Bhubaneswar"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "AIIMS,Bhubaneswar";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 2,
                                      child: Text("SCB,Cuttack"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "SCB,Cuttack";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 3,
                                      child: Text("SUM Hospital,Bhubaneswar"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "SUM Hospital,Bhubaneswar";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 4,
                                      child: Text("AMRI Hospital,Bhubaneswar"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "AMRI Hospital,Bhubaneswar";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 5,
                                      child:
                                          Text("APOLLO Hospital,Bhubaneswar"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "APOLLO Hospital,Bhubaneswar";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 6,
                                      child: Text("KIMS Hospital,Bhubaneswar"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "KIMS Hospital,Bhubaneswar";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 7,
                                      child:
                                          Text("Sparsh Hospital,Bhubaneswar"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "Sparsh Hospital,Bhubaneswar";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 8,
                                      child: Text("Care Ultima,Bhubaneswar"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "Care Ultima,Bhubaneswar";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 9,
                                      child: Text("Kar Clinic,Bhubaneswar"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "Kar Clinic,Bhubaneswar";
                                        });
                                      },
                                    ),
                                    PopupMenuItem(
                                      value: 10,
                                      child:
                                          Text("Aspire Hospital,Bhubaneswar"),
                                      onTap: () {
                                        setState(() {
                                          hospitalController.text =
                                              "Aspire Hospital,Bhubaneswar";
                                        });
                                      },
                                    ),
                                  ]),
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "enter hospital";
                          } else {
                            return null;
                          }
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: TextFormField(
                        controller: securityController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: "Hospital Key",
                          labelText: "Hospital Key",
                          prefixIcon: Icon(Icons.key),
                          border: OutlineInputBorder(),
                        ),
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "enter key";
                          } else {
                            return null;
                          }
                        }),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: RoundButton(
                        loading: loading,
                        title: "submit",
                        onTap: (() {
                          if (_formKey.currentState!.validate() &&
                              securityController.text.toString() == "770055") {
                            setState(() {
                              loading = true;
                            });
                            final id = DateTime.now()
                                .millisecondsSinceEpoch
                                .toString();
                            database.child(id).set({
                              "name": nameController.text.toString(),
                              "organ": organController.text.toString(),
                              "date": dateController.text.toString(),
                              "hospital": hospitalController.text.toString(),
                              "key": securityController.text.toString(),
                            }).then((value) {
                              setState(() {
                                loading = false;
                              });
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          CertificatePage())));
                              Utilss().toastMessage(
                                  "Thank You For your Valuable Support");
                            }).onError((error, stackTrace) {
                              setState(() {
                                loading = false;
                              });
                              Utils().toastMessage(error.toString());
                            });
                          } else {
                            Utils().toastMessage("Invalid Security Key");
                          }
                        }),
                        //color: Colors.deepPurple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      //),
    );
  }
}
