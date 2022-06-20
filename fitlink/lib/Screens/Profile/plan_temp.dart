import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/constants.dart';
import 'package:fitlink/services/database.dart';
import 'package:flutter/material.dart';

class PlanT extends StatefulWidget {
  PlanT({Key? key}) : super(key: key);

  @override
  State<PlanT> createState() => _PlanTState();
}

class _PlanTState extends State<PlanT> {
  @override
  Widget build(BuildContext context) {

    final FirebaseAuth auth = FirebaseAuth.instance;
    String currentUser = auth.currentUser!.uid;
    Stream<QuerySnapshot<Map<String, dynamic>>> ptPlans = FirebaseFirestore.instance.collection('ptplans').snapshots();

    Future<Map<String, String>> plan;

    return Scaffold(
        appBar: AppBar(
        title: Text("Personal Trainer Plan"),
        backgroundColor: kDarkPrimaryColor,
      ),
            body: Container(
            child: StreamBuilder<QuerySnapshot>(
              stream: ptPlans, 
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
                              primary: Color.fromARGB(255, 9, 173, 121),
                              shadowColor: Color.fromARGB(255, 17, 1, 6),
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              textStyle: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                            onPressed: () {
                                // aqui dar update a db e bazar da pagina 
                              
                              },

                            label: 
                            Text(" ${data.docs[index]['daysofweek']}"), // <-- Text
                            icon: Icon( // <-- Icon
                              Icons.access_alarm_sharp,
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