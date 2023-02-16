import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import '../forms/certificate_generate.dart';
import '../homepage/home_page.dart';

class RequestorListPage extends StatefulWidget {
  const RequestorListPage({super.key});

  @override
  State<RequestorListPage> createState() => _RequestorListPageState();
}

class _RequestorListPageState extends State<RequestorListPage> {
  final ref = FirebaseDatabase.instance.ref("requestor");
  List organ = [
    'Heart',
    'Kidney',
    'intestine',
    'Bone Marrow',
    'Eyes',
    'Skin',
    'Pancreas',
    'Liver',
    'lungs'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.indigo.shade200,
                  Color.fromARGB(255, 42, 22, 77),
                ]),
            // image: DecorationImage(
            //     image: AssetImage("assets/images/photo.jpg"), fit: BoxFit.fill),
          ),
          child: Column(children: [
            Row(children: [
              SizedBox(height: 80),
              Padding(
                padding: const EdgeInsets.only(left: 335.0, top: 30),
                child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => HomePage())));
                    },
                    icon: Icon(
                      Icons.home,
                      size: 26,
                    )),
              ),
            ]),
            Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text("Requestor List",
                      style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                )),
            SizedBox(height: 25),
            Expanded(
              child: FirebaseAnimatedList(
                query: ref,
                itemBuilder: ((context, snapshot, animation, index) {
                  final data = snapshot.child('name').value.toString();
                  if (snapshot.child('organSpecified').value.toString() ==
                      organ[0]) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        child: ListTile(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: 300,
                                      width: 250,
                                      //color: Colors.grey.shade300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://media.istockphoto.com/id/1205212219/photo/anatomy-of-human-heart.jpg?s=170667a&w=0&k=20&c=dgxEI6h4nvtN72rBwU8PjyjjineSdX1-fv6BKtQRGE0="),
                                            fit: BoxFit.cover,
                                            opacity: 50),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot
                                                  .child("name")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("organSpecified")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("hospital")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("bloodGroup")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.phone,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text(
                                                  "${snapshot.child("phoneNo").value.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          if (snapshot
                                                  .child("time")
                                                  .value
                                                  .toString() !=
                                              null)
                                            Text(
                                                "${snapshot.child("time").value.toString()}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.picxy.com/cache/2020/10/28/1bd593f80e947673a9212108efd6e202.jpg")),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              //child: Image.network(
                              //    "https://images.picxy.com/cache/2020/10/28/1bd593f80e947673a9212108efd6e202.jpg"),
                            ),
                          ),
                          title: Center(
                            child: Text(snapshot
                                .child('organSpecified')
                                .value
                                .toString()),
                          ),
                          subtitle: Center(
                              child: Text(
                                  snapshot.child('name').value.toString())),
                          trailing: Text(
                            snapshot.child('bloodGroup').value.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot
                          .child('organSpecified')
                          .value
                          .toString() ==
                      organ[1]) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        child: ListTile(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: 300,
                                      width: 250,
                                      //color: Colors.grey.shade300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://wallpaperaccess.com/full/5917781.jpg"),
                                            fit: BoxFit.cover,
                                            opacity: 50),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot
                                                  .child("name")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("organSpecified")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("hospital")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("bloodGroup")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.phone,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text(
                                                  "${snapshot.child("phoneNo").value.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          if (snapshot
                                                  .child("time")
                                                  .value
                                                  .toString() !=
                                              null)
                                            Text(
                                                "${snapshot.child("time").value.toString()}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "http://med.stanford.edu/content/dam/sm-news/images/2014/06/kidney-stock.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            // child: Image.network(
                            //     "http://med.stanford.edu/content/dam/sm-news/images/2014/06/kidney-stock.jpg"),
                          ),
                          title: Center(
                            child: Text(snapshot
                                .child('organSpecified')
                                .value
                                .toString()),
                          ),
                          subtitle: Center(
                              child: Text(
                                  snapshot.child('name').value.toString())),
                          trailing: Text(
                            snapshot.child('bloodGroup').value.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot
                          .child('organSpecified')
                          .value
                          .toString() ==
                      organ[2]) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        child: ListTile(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: 300,
                                      width: 250,
                                      //color: Colors.grey.shade300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://media.istockphoto.com/id/1256373514/photo/3d-illustration-of-colon-cancer-colon-tumor.jpg?s=612x612&w=0&k=20&c=FTOMcuqdRTMjVzttSTnkydng4mv7ZhjHSBYP-mfJteY="),
                                            fit: BoxFit.cover,
                                            opacity: 50),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot
                                                  .child("bloodGroup")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 40,
                                                  fontWeight: FontWeight.bold)),
                                          Text(
                                              snapshot
                                                  .child("name")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("organSpecified")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("hospital")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.phone,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text(
                                                  "${snapshot.child("phoneNo").value.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          if (snapshot
                                                  .child("time")
                                                  .value
                                                  .toString() !=
                                              null)
                                            Text(
                                                "${snapshot.child("time").value.toString()}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.3d4medical.com/media/blog/small_intestine_2.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            // child: Image.network(
                            //     //https://cdn.3d4medical.com/media/blog/small_intestine_2.jpg
                            //     "https://cdn.3d4medical.com/media/blog/small_intestine_2.jpg"),
                          ),
                          title: Center(
                            child: Text(snapshot
                                .child('organSpecified')
                                .value
                                .toString()),
                          ),
                          subtitle: Center(
                              child: Text(
                                  snapshot.child('name').value.toString())),
                          trailing: Text(
                            snapshot.child('bloodGroup').value.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot
                          .child('organSpecified')
                          .value
                          .toString() ==
                      organ[3]) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        child: ListTile(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: 300,
                                      width: 250,
                                      //color: Colors.grey.shade300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://media.istockphoto.com/id/1256257085/photo/cross-section-anatomy-of-human-bone.jpg?b=1&s=170667a&w=0&k=20&c=AaaOlyNnZRZcYL0E69kOdSyTSAiyEgxOGoZiL2wdRMU="),
                                            fit: BoxFit.cover,
                                            opacity: 50),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot
                                                  .child("name")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("organSpecified")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("hospital")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("bloodGroup")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.phone,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text(
                                                  "${snapshot.child("phoneNo").value.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          if (snapshot
                                                  .child("time")
                                                  .value
                                                  .toString() !=
                                              null)
                                            Text(
                                                "${snapshot.child("time").value.toString()}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://www.pbmchealth.org/application/files/5216/0566/1901/Red-Bone-Marrow-Vs-Yellow-Bone-Marrow.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            // child: Image.network(
                            //     "https://www.pbmchealth.org/application/files/5216/0566/1901/Red-Bone-Marrow-Vs-Yellow-Bone-Marrow.jpg"),
                          ),
                          title: Center(
                            child: Text(snapshot
                                .child('organSpecified')
                                .value
                                .toString()),
                          ),
                          subtitle: Center(
                              child: Text(
                                  snapshot.child('name').value.toString())),
                          trailing: Text(
                            snapshot.child('bloodGroup').value.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot
                          .child('organSpecified')
                          .value
                          .toString() ==
                      organ[4]) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        child: ListTile(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: 300,
                                      width: 250,
                                      //color: Colors.grey.shade300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://cdn.pixabay.com/photo/2020/06/01/22/23/eye-5248678__340.jpg"),
                                            fit: BoxFit.cover,
                                            opacity: 50),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot
                                                  .child("name")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("organSpecified")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("hospital")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("bloodGroup")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.phone,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text(
                                                  "${snapshot.child("phoneNo").value.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          if (snapshot
                                                  .child("time")
                                                  .value
                                                  .toString() !=
                                              null)
                                            Text(
                                                "${snapshot.child("time").value.toString()}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://images.indianexpress.com/2020/10/pixabay_eye-donation_1200.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(52),
                              ),
                            ),
                            // child: Image.network(
                            //     "https://images.indianexpress.com/2020/10/pixabay_eye-donation_1200.jpg"),
                          ),
                          title: Center(
                            child: Text(snapshot
                                .child('organSpecified')
                                .value
                                .toString()),
                          ),
                          subtitle: Center(
                              child: Text(
                                  snapshot.child('name').value.toString())),
                          trailing: Text(
                            snapshot.child('bloodGroup').value.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot
                          .child('organSpecified')
                          .value
                          .toString() ==
                      organ[5]) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        child: ListTile(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: 300,
                                      width: 250,
                                      //color: Colors.grey.shade300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://c1.wallpaperflare.com/preview/881/472/914/skin-brown-skin-skin-up-close-brown-skin-up-close.jpg"),
                                            fit: BoxFit.cover,
                                            opacity: 50),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot
                                                  .child("name")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("organSpecified")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("hospital")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("bloodGroup")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.phone,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text(
                                                  "${snapshot.child("phoneNo").value.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          if (snapshot
                                                  .child("time")
                                                  .value
                                                  .toString() !=
                                              null)
                                            Text(
                                                "${snapshot.child("time").value.toString()}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.mos.cms.futurecdn.net/UpQNNuE9QjptyPma55sbdN.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(52),
                              ),
                            ),
                            // child: Image.network(
                            //     "https://cdn.mos.cms.futurecdn.net/UpQNNuE9QjptyPma55sbdN.jpg"),
                          ),
                          title: Center(
                            child: Text(snapshot
                                .child('organSpecified')
                                .value
                                .toString()),
                          ),
                          subtitle: Center(
                              child: Text(
                                  snapshot.child('name').value.toString())),
                          trailing: Text(
                            snapshot.child('bloodGroup').value.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot
                          .child('organSpecified')
                          .value
                          .toString() ==
                      organ[6]) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        child: ListTile(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: 300,
                                      width: 250,
                                      //color: Colors.grey.shade300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://us.123rf.com/450wm/nerthuz/nerthuz1407/nerthuz140700030/30006072-human-gallbladder-and-pancreas-anatomy.jpg"),
                                            fit: BoxFit.cover,
                                            opacity: 50),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot
                                                  .child("name")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("organSpecified")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("hospital")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("bloodGroup")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.phone,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text(
                                                  "${snapshot.child("phoneNo").value.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          if (snapshot
                                                  .child("time")
                                                  .value
                                                  .toString() !=
                                              null)
                                            Text(
                                                "${snapshot.child("time").value.toString()}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://cdn.mos.cms.futurecdn.net/6nZWaqsX5KvF8AB2QTj7NS-1200-80.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(52),
                              ),
                            ),
                            // child: Image.network(
                            //     "https://cdn.mos.cms.futurecdn.net/6nZWaqsX5KvF8AB2QTj7NS-1200-80.jpg"),
                          ),
                          title: Center(
                            child: Text(snapshot
                                .child('organSpecified')
                                .value
                                .toString()),
                          ),
                          subtitle: Center(
                              child: Text(
                                  snapshot.child('name').value.toString())),
                          trailing: Text(
                            snapshot.child('bloodGroup').value.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot
                          .child('organSpecified')
                          .value
                          .toString() ==
                      organ[7]) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        child: ListTile(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: 300,
                                      width: 250,
                                      //color: Colors.grey.shade300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_CkuhrY7RD-KUPZksJ5otLzn2BhmV5CXtQIwdlIerq1EALpSeaD9-rVq-sbtl8Q9Ofd4&usqp=CAU"),
                                            fit: BoxFit.cover,
                                            opacity: 50),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot
                                                  .child("name")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("organSpecified")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("hospital")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("bloodGroup")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.phone,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text(
                                                  "${snapshot.child("phoneNo").value.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          if (snapshot
                                                  .child("time")
                                                  .value
                                                  .toString() !=
                                              null)
                                            Text(
                                                "${snapshot.child("time").value.toString()}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://media.sciencephoto.com/c0/49/91/46/c0499146-800px-wm.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(52),
                              ),
                            ),
                            // child: Image.network(
                            //     "https://media.sciencephoto.com/c0/49/91/46/c0499146-800px-wm.jpg"),
                          ),
                          title: Center(
                            child: Text(snapshot
                                .child('organSpecified')
                                .value
                                .toString()),
                          ),
                          subtitle: Center(
                              child: Text(
                                  snapshot.child('name').value.toString())),
                          trailing: Text(
                            snapshot.child('bloodGroup').value.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else if (snapshot
                          .child('organSpecified')
                          .value
                          .toString() ==
                      organ[8]) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Card(
                        color: Colors.grey.shade300,
                        elevation: 2,
                        child: ListTile(
                          onTap: () async {
                            await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return Center(
                                    child: Container(
                                      height: 300,
                                      width: 250,
                                      //color: Colors.grey.shade300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.transparent,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                "https://media.istockphoto.com/id/1324669080/photo/lung-cancer-lung-disease-3d-illustration.jpg?b=1&s=170667a&w=0&k=20&c=cx5zvl-3VBzL1m-uWjwI8DIuVLvhm51sehm8mVVH6K4="),
                                            fit: BoxFit.cover,
                                            opacity: 50),
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                              snapshot
                                                  .child("name")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("organSpecified")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("hospital")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                              snapshot
                                                  .child("bloodGroup")
                                                  .value
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: 26,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(Icons.phone,
                                                  color: Colors.white),
                                              SizedBox(width: 5),
                                              Text(
                                                  "${snapshot.child("phoneNo").value.toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              SizedBox(height: 2),
                                              if (snapshot
                                                      .child("date")
                                                      .value
                                                      .toString() !=
                                                  null)
                                                Text(
                                                    "${snapshot.child("date").value.toString()}",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                            ],
                                          ),
                                          SizedBox(height: 5),
                                          if (snapshot
                                                  .child("time")
                                                  .value
                                                  .toString() !=
                                              null)
                                            Text(
                                                "${snapshot.child("time").value.toString()}",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          leading: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Container(
                              height: 52,
                              width: 52,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://i.ytimg.com/vi/Wd_ylZSHlgA/maxresdefault.jpg"),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(52),
                              ),
                            ),
                            // child: Image.network(
                            //     "https://i.ytimg.com/vi/Wd_ylZSHlgA/maxresdefault.jpg"),
                          ),
                          title: Center(
                            child: Text(snapshot
                                .child('organSpecified')
                                .value
                                .toString()),
                          ),
                          subtitle: Center(
                              child: Text(
                                  snapshot.child('name').value.toString())),
                          trailing: Text(
                            snapshot.child('bloodGroup').value.toString(),
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
              ),
              //),
            ),
            //),
          ]),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Container(
          color: Colors.deepPurple.shade500,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(20.0),
          // ),
          child: IconButton(
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: ((context) => CertificateGenerate())));
              },
              icon: Icon(
                Icons.file_download_outlined,
                size: 35,
              )),
        ),
      ),
      //drawer: Drawer(),
    );
  }
}
