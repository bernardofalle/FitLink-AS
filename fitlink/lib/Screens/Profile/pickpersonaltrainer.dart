import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/Screens/Profile/home_screen.dart';
import 'package:fitlink/Screens/Profile/star_screen.dart';
import 'package:fitlink/Screens/Profile/zegreg_screen.dart';
import 'package:fitlink/Screens/Welcome/welcome_screen.dart';
import 'package:fitlink/constants.dart';
import 'package:fitlink/services/auth.dart';
import 'package:fitlink/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PickPersonalScreen extends StatefulWidget {
  PickPersonalScreen({Key? key}) : super(key: key);

  @override
  State<PickPersonalScreen> createState() => _PickPersonalScreenState();
}

class _PickPersonalScreenState extends State<PickPersonalScreen> {
  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot<Map<String, dynamic>>> ptCollec =
        FirebaseFirestore.instance.collection('ptcollection').snapshots();

    ScreenUtil.init(context);
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pick a Personal Trainer"),
        backgroundColor: kDarkPrimaryColor,
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: ptCollec,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasError) {
              return const Text("Something went wrong.");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading");
            }

            final data = snapshot.requireData;

            return ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 230, 200, 82),
                          shadowColor: const Color.fromARGB(255, 255, 0, 0),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () async {
                        //print("${data.docs[index].reference.id}");
                        // aqui dar update a db e bazar da pagina
                        await DatabaseService(uid: currentUser!.uid)
                            .updateUserPT(data.docs[index].reference.id);
                        _showToast(context, data.docs[index]["name"]);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                        );
                      },

                      label: Text(
                          "My name is ${data.docs[index]['name']} and im ${data.docs[index]['age']} and my specialization is ${data.docs[index]['specialization']}"), // <-- Text
                      icon: const Icon(
                        // <-- Icon
                        Icons.add_box_rounded,
                        size: 50.0,
                      ),
                    ));
              },
            );
          },
        ),
      ),
    );
  }
}

/*
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Pick a Personal Trainer",
                          style: kTitleTextStyle2,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        print("back");
                        Navigator.pop(context);
                      },
                      child: Icon(LineAwesomeIcons.times)),
                ],
              ),
            ),*/
void _showToast(BuildContext context, String ptname) {
  final scaffold = ScaffoldMessenger.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: Text('You chose $ptname as your Personal Trainer!'),
      action: SnackBarAction(
          label: 'Remove', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}
