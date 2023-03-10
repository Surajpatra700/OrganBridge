import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';
import '../actions/round_button.dart';
import '../actions/utils.dart';
import '../actions/utils_2.dart';
import '../screens/requestor_list_page.dart';

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
  File? _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image picked");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          centerTitle: true,
          title: "Donor Form Page".text.bold.make(),
          backgroundColor: Colors.indigo.shade700,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover,
              opacity: 30,
              filterQuality: FilterQuality.high,
            ),
          ),
          child: Form(
            key: _myFormKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 24,
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
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:
                              BorderSide(color: Colors.indigo.shade300)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your phone no";
                    } else if (value.length < 10) {
                      return "Please enter valid phone no";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white70),
                    labelStyle: TextStyle(color: Colors.white70),
                    labelText: "Phone No",
                    hintText: "Enter your phone no.",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.indigo.shade300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: bloodGroupController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your blood group";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white70),
                    labelStyle: TextStyle(color: Colors.white70),
                    suffixIcon: PopupMenuButton(
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
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
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.indigo.shade300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
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
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
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
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide(color: Colors.indigo.shade300),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: preferenceController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white70),
                    labelStyle: TextStyle(color: Colors.white70),
                    labelText: "Preference of Donation",
                    suffixIcon: PopupMenuButton(
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
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
                                    preferenceController.text = "Live donate";
                                  });
                                },
                              ),
                            ]),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.indigo.shade300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: hospitalController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white70),
                    labelStyle: TextStyle(color: Colors.white70),
                    labelText: "Hospital Availability",
                    suffixIcon: PopupMenuButton(
                        icon: Icon(Icons.arrow_drop_down, color: Colors.white),
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
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.indigo.shade300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: dobController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: Colors.white70),
                    labelStyle: TextStyle(color: Colors.white70),
                    hintText: "yyyy-mm-dd",
                    prefixIcon:
                        Icon(Icons.calendar_today_rounded, color: Colors.white),
                    labelText: "Date of Birth",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.indigo.shade300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
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
                  height: 32,
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
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: Colors.indigo.shade300)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HLA report",
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                    Text(
                      "*",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    getImageFromGallery();
                  },
                  child: Container(
                    height: 80,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Colors.indigo.shade300),
                    ),
                    child: _image != null
                        ? Image.file(_image!.absolute)
                        : Icon(
                            Icons.upload_file_rounded,
                            color: Colors.white60,
                          ),
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                RoundButton(
                  title: "Submit",
                  loading: loading,
                  onTap: () {
                    //final time = DateTime.now();
                    setState(() {
                      loading = true;
                    });
                    final id = DateTime.now().microsecondsSinceEpoch.toString();
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
                        setState(() {
                          loading = false;
                        });
                        Utilss().toastMessage("Succesfully submitted");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => RequestorListPage())));
                        setState(() {
                          loading = false;
                        });
                      }).onError((error, stackTrace) {
                        setState(() {
                          loading = false;
                        });
                        Utils().toastMessage(error.toString());
                      });
                    }
                  },
                  //color: Colors.indigo.shade300
                ),
                SizedBox(
                  height: 32,
                ),
              ],
            ).px20(),
          ),
        ),
      ),
    );
  }
}
