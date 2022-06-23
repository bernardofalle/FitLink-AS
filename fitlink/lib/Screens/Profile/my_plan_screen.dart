import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/constants.dart';

class MyPlan extends StatefulWidget {
  MyPlan({Key? key}) : super(key: key);

  @override
  State<MyPlan> createState() => _MyPlanState();
}

class _MyPlanState extends State<MyPlan> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String currentUser = auth.currentUser!.uid;
    print(currentUser);
    Stream<DocumentSnapshot<Map<String, dynamic>>> ptPlans = FirebaseFirestore.instance.collection('userPlans').doc(currentUser).snapshots();

    Future<Map<String, String>> plan;

    return Scaffold(
        appBar: AppBar(
        title: Text("My Plan"),
        backgroundColor: kDarkPrimaryColor,
      ),
            body: Container(
            child: StreamBuilder<DocumentSnapshot>(
              stream: ptPlans, 
              builder: (
                BuildContext context, 
                AsyncSnapshot<DocumentSnapshot> snapshot,
                ) {
                  if(snapshot.hasError){
                    return Text("Something went wrong.");
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Text("Loading");
                  }

                  final data = snapshot.requireData;

                  return ListView.builder(
                    itemCount: 1,
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
                            Text("This is your Plan.\n\nMonday Plan: \n${data['monday']}\n\nTuesday Plan: \n${data['tuesday']}\n\nWednesday Plan: \n${data['wednesday']}\n\nThursday Plan: \n${data['thursday']}\n\nFriday Plan: \n${data['friday']}\n\nSaturday Plan: \n${data['saturday']}\n\nSunday Plan: \n${data['sunday']}"), // <-- Text
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