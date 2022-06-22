import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/constants.dart';
import 'package:fitlink/services/auth.dart';
import 'package:fitlink/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

String formatTime(int milliseconds) {
  var secs = milliseconds ~/ 1000;
  var hours = (secs ~/ 3600).toString().padLeft(2, '0');
  var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
  var seconds = (secs % 60).toString().padLeft(2, '0');
  return "$hours:$minutes:$seconds";
}

class Journaling extends StatefulWidget {
  const Journaling({Key? key}) : super(key: key);

  @override
  State<Journaling> createState() => _JournalingState();
}

class _JournalingState extends State<Journaling> {
  late TextEditingController weightController;
  late TextEditingController liftController;
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    weightController = TextEditingController();
    liftController = TextEditingController();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
    } else {
      _stopwatch.start();
    }
    setState(() {}); // re-render the page
  }

  Future<String?> openDialog() => showDialog<String>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Calculate your wilks coefficient!"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: weightController,
                autofocus: true,
                decoration:
                    const InputDecoration(hintText: 'Enter your body weight!'),
              ),
              TextField(
                controller: liftController,
                decoration: const InputDecoration(
                    hintText: 'Enter the weight you lifted!'),
              ),
            ],
          ),
          actions: [
            TextButton(onPressed: calculate, child: const Text('Calculate'))
          ],
        ),
      );

  void calculate() {
    double a = 594.31747775582;
    double b = -27.23842536447;
    double c = 0.82112226871;
    double d = -0.00930733913;
    double e = 4.731582E-05;
    double f = -9.054E-08;
    double W = double.parse(liftController.text);
    double x = double.parse(weightController.text);
    double result = W *
        (500 /
            (a +
                (b * pow(x, 1)) +
                (c * pow(x, 2)) +
                (d * pow(x, 3)) +
                (e * pow(x, 4)) +
                (f * pow(x, 5))));
    print(result);

    Navigator.of(context).pop(result.toString());
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    DocumentReference mainDB =
        FirebaseFirestore.instance.collection('mainDB').doc(currentUser!.uid);

    return Scaffold(
      appBar: AppBar(title: const Text('Journaling')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(formatTime(_stopwatch.elapsedMilliseconds),
                style: const TextStyle(fontSize: 48.0)),
            ElevatedButton(
              onPressed: handleStartStop,
              child: Text(_stopwatch.isRunning ? 'Stop' : 'Start'),
            ),
            ElevatedButton(
              onPressed: () async {
                final r = await openDialog();
                if (r == null) return;
                await DatabaseService(uid: currentUser!.uid).updateUserCoeff(r);
              },
              child: const Text('My workout is over!'),
            ),
            const SizedBox(
              height: 100,
            ),
            FutureBuilder<DocumentSnapshot>(
              future: mainDB.get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return const Text("Document does not exist");
                }

                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text(
                  "Your current wilks coefficient is : ${data['wilks_coeff']}",
                  style: kTitleTextStyle,
                  textAlign: TextAlign.center,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
