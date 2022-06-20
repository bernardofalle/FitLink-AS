import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitlink/Screens/Profile/zegreg_screen.dart';
import 'package:fitlink/constants.dart';
import 'package:fitlink/models/personaltrainer.dart';
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

    Stream<QuerySnapshot<Map<String, dynamic>>> ptCollec = FirebaseFirestore.instance.collection('ptcollection').snapshots();
    
    ScreenUtil.init(context);

    return Scaffold(
      body: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: ptCollec, 
              builder: (
                BuildContext context, 
                AsyncSnapshot<QuerySnapshot> snapshot,
                ) {
                  if(snapshot.hasError){
                    return Text("Something went wron.");
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text("Loading");
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                    itemCount: data.size ,
                    itemBuilder: (context, index){
                      return Container(
                        margin: EdgeInsets.only(top: 20),
                        child: 
                          ElevatedButton.icon(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 236, 194, 28),
                              shadowColor: Color.fromARGB(255, 255, 0, 0),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                            onPressed: () {print("${data.docs[index]['name']}");},

                            label: 
                            Text("My name is ${data.docs[index]['name']} and im ${data.docs[index]['age']} and my specialization is ${data.docs[index]['specialization']}"), // <-- Text
                            icon: Icon( // <-- Icon
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