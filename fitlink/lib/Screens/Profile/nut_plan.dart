import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/constants.dart';
import 'package:fitlink/services/database.dart';
import 'package:flutter/material.dart';

class PlanNUT extends StatefulWidget {
  PlanNUT({Key? key}) : super(key: key);

  @override
  State<PlanNUT> createState() => _PlanNUTState();
}

class _PlanNUTState extends State<PlanNUT> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    String currentUser = auth.currentUser!.uid;
    Stream<QuerySnapshot<Map<String, dynamic>>> ptPlans =
        FirebaseFirestore.instance.collection('nutplans').snapshots();

    Future<Map<String, String>> plan;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Nutritionist plan"),
        backgroundColor: kDarkPrimaryColor,
      ),
      body: Container(
        child: StreamBuilder<QuerySnapshot>(
          stream: ptPlans,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasError) {
              return const Text("Something went wron.");
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
                          primary: Color.fromARGB(255, 145, 109, 231),
                          shadowColor: const Color.fromARGB(255, 17, 1, 6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      onPressed: () {
                        // aqui dar update a db e bazar da pagina
                      },

                      label: Text(
                          " ${data.docs[index]['daysofweek']}"), // <-- Text
                      icon: const Icon(
                        // <-- Icon
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
