// // ignore_for_file: prefer_final_fields, prefer_const_constructors, curly_braces_in_flow_control_structures
// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:organ_bridge_project/actions/round_button.dart';
import 'package:organ_bridge_project/actions/utils.dart';
//import 'package:organ_bridge/actions/utils.dart';
//import 'package:organ_bridge/actions/round_button.dart';
//import 'package:organ_bridge/screens/requestor_list_page.dart';
//import 'dart:ui';

class DonorFormPage extends StatefulWidget {
  const DonorFormPage({super.key});

  @override
  State<DonorFormPage> createState() => _DonorFormPageState();
}

class _DonorFormPageState extends State<DonorFormPage> {
  final firebaseRef = FirebaseDatabase.instance.ref("donor");
  final auth = FirebaseAuth.instance;
  final _myFormKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final bloodGroupController = TextEditingController();
  final organController = TextEditingController();
  final preferenceController = TextEditingController();
  final hospitalController = TextEditingController();
  final dobController = TextEditingController();
  final timeController = TextEditingController();
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Donor Form Page",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.deepPurple,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/background.jpg"),
                fit: BoxFit.fill,
                opacity: 30,
                filterQuality: FilterQuality.high),
          ),
          child: Form(
              key: _myFormKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Donor's Details",
                          style: TextStyle(
                              fontSize: 24,
                              letterSpacing: 1,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        controller: nameController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter your Name";
                          } else if (value.length < 3) {
                            return "Name should be atleast 3 character";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          hintStyle: TextStyle(color: Colors.white70),
                          labelStyle: TextStyle(color: Colors.white70),
                          labelText: "Name",
                          hintText: "enter your name",
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Colors.deepPurple)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Phone no";
                        } else if (value.length < 10) {
                          return "Please enter valid Phone no";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        labelStyle: TextStyle(color: Colors.white70),
                        labelText: "Phone No",
                        hintText: "enter your Phone no",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: bloodGroupController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your Blood group";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        labelStyle: TextStyle(color: Colors.white70),
                        suffixIcon: PopupMenuButton(
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.white),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text("A+"),
                                    onTap: () {
                                      setState(() {
                                        bloodGroupController.text = "A+";
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: Text("B+"),
                                    onTap: () {
                                      setState(() {
                                        bloodGroupController.text = "B+";
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 3,
                                    child: Text("O+"),
                                    onTap: () {
                                      setState(() {
                                        bloodGroupController.text = "O+";
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 4,
                                    child: Text("A-"),
                                    onTap: () {
                                      setState(() {
                                        bloodGroupController.text = "A-";
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 5,
                                    child: Text("B-"),
                                    onTap: () {
                                      setState(() {
                                        bloodGroupController.text = "B-";
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 6,
                                    child: Text("O-"),
                                    onTap: () {
                                      setState(() {
                                        bloodGroupController.text = "O-";
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 7,
                                    child: Text("AB+"),
                                    onTap: () {
                                      setState(() {
                                        bloodGroupController.text = "AB+";
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 8,
                                    child: Text("AB-"),
                                    onTap: () {
                                      setState(() {
                                        bloodGroupController.text = "AB-";
                                      });
                                    },
                                  ),
                                ]),
                        labelText: "Blood Group",
                        hintText: "Blood Group",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: organController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        labelStyle: TextStyle(color: Colors.white70),
                        labelText: "Organ Specification",
                        hintText: "Organ Specification",
                        suffixIcon: PopupMenuButton(
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.white),
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
                                ]),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: preferenceController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        labelStyle: TextStyle(color: Colors.white70),
                        labelText: "Preference of Donation",
                        suffixIcon: PopupMenuButton(
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.white),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    value: 1,
                                    child: Text("Cadival donate"),
                                    onTap: () {
                                      setState(() {
                                        preferenceController.text =
                                            "Cadival donate";
                                      });
                                    },
                                  ),
                                  PopupMenuItem(
                                    value: 2,
                                    child: Text("Live donate"),
                                    onTap: () {
                                      setState(() {
                                        preferenceController.text =
                                            "Live donate";
                                      });
                                    },
                                  ),
                                ]),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: hospitalController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        labelStyle: TextStyle(color: Colors.white70),
                        labelText: "Hospital Availability",
                        suffixIcon: PopupMenuButton(
                            icon: Icon(Icons.arrow_drop_down,
                                color: Colors.white),
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
                                        hospitalController.text = "SCB,Cuttack";
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
                                    child: Text("APOLLO Hospital,Bhubaneswar"),
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
                                    child: Text("Sparsh Hospital,Bhubaneswar"),
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
                                    child: Text("Aspire Hospital,Bhubaneswar"),
                                    onTap: () {
                                      setState(() {
                                        hospitalController.text =
                                            "Aspire Hospital,Bhubaneswar";
                                      });
                                    },
                                  ),
                                ]),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: dobController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.white70),
                        labelStyle: TextStyle(color: Colors.white70),
                        hintText: "yyyy-mm-dd",
                        prefixIcon: Icon(Icons.calendar_today_rounded,
                            color: Colors.white),
                        labelText: "Date of Birth",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onTap: () async {
                        DateTime? pickeddate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1930),
                            lastDate: DateTime.now());
                        if (pickeddate != null) {
                          setState(() {
                            dobController.text = pickeddate.toString();
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: timeController,
                      onTap: () {
                        setState(() {
                          final time = DateTime.now();
                          String t =
                              "${time.day}/${time.month}/${time.year}  ${time.hour}:${time.minute}:${time.second}";
                          timeController.text = t.toString();
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Present Time",
                        labelStyle: TextStyle(color: Colors.white70),
                        hintText: "set present time",
                        hintStyle: TextStyle(color: Colors.white70),
                        prefixIcon: Icon(
                          Icons.watch,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Colors.deepPurple)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(
                    //     labelText: "Present Time",
                    //     labelStyle: TextStyle(color: Colors.white),
                    //     hintText: "set present time",
                    //     hintStyle: TextStyle(color: Colors.white),
                    //     enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10.0),
                    //         borderSide: BorderSide(color: Colors.deepPurple)),
                    //     border: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(10.0),
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    RoundButton(
                      title: "submit",
                      loading: loading,
                      onTap: () {
                        //final time = DateTime.now();
                        setState(() {
                          loading = true;
                        });
                        final id =
                            DateTime.now().microsecondsSinceEpoch.toString();
                        if (_myFormKey.currentState!.validate()) {
                          firebaseRef.child(id).set({
                            "id": id,
                            "name": nameController.text.toString(),
                            "phoneNo": phoneController.text.toString(),
                            "bloodGroup": bloodGroupController.text.toString(),
                            "organSpecified": organController.text.toString(),
                            "Preference": preferenceController.text.toString(),
                            "hospital": hospitalController.text.toString(),
                            "dob": dobController.text.toString(),
                            "time": timeController.text.toString(),
                          }).then((value) {
                            // setState(() {
                            //   loading = false;
                            // });
                            Utils().toastMessage("Succesfully submitted");
                            //Navigator.push(
                              //  context,
                                //MaterialPageRoute(
                                  //  builder: ((context) =>
                                    //    RequestorListPage())));
                            setState(() {
                              loading = false;
                            });
                          }).onError((error, stackTrace) {
                            // setState(() {
                            //   loading = false;
                            // });
                            Utils().toastMessage(error.toString());
                            setState(() {
                              loading = false;
                            });
                          });
                        }
                      },
                      //color: Colors.deepPurple
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              )),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.deepPurple,
      //   onPressed: () {
      //     _myFormKey.currentState!.validate();
      //   },
      //   child: Icon(
      //     Icons.done,
      //     color: Colors.white,
      //     //size: 5,
      //     //weight: 4,
      //   ),
      // ),
    );
  }
}
