import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/Screens/Profile/dailyprogress_screen.dart';
import 'package:fitlink/Screens/Profile/home_screen.dart';
import 'package:fitlink/Screens/Profile/workout_screen.dart';
import 'package:fitlink/services/database.dart';
import 'package:flutter/material.dart';

class MakePlan extends StatefulWidget {
  const MakePlan({Key? key}) : super(key: key);

  @override
  State<MakePlan> createState() => _MakePlanState();
}

class _MakePlanState extends State<MakePlan> {
  @override
  Widget build(BuildContext context) {
    TextEditingController mondayController = TextEditingController();
    TextEditingController tuesdayController = TextEditingController();
    TextEditingController wednesdayController = TextEditingController();
    TextEditingController thursdayController = TextEditingController();
    TextEditingController fridayController = TextEditingController();
    TextEditingController saturdayController = TextEditingController();
    TextEditingController sundayController = TextEditingController();
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Make your plan !'),
      ),
      body: Center(
        child: SizedBox(
          width: 300,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                TextField(
                  controller: mondayController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your monday exercises!'),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: tuesdayController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your tuesday exercises!'),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: wednesdayController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your wednesday exercises!'),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: thursdayController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your thursday exercises!'),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: fridayController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your friday exercises!'),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: saturdayController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your saturday exercises!'),
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: sundayController,
                  decoration: const InputDecoration(
                      hintText: 'Enter your sunday exercises!'),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                    onPressed: () async {
                      await DatabaseService(uid: currentUser!.uid).addUserPlan(
                          mondayController.text,
                          tuesdayController.text,
                          wednesdayController.text,
                          thursdayController.text,
                          fridayController.text,
                          saturdayController.text,
                          sundayController.text);

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("You've added a new plan! (Limited to one)"),
                      ));

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WorkoutScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Sumbit plan!',
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
