import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/Screens/Profile/makeplan.dart';
import 'package:fitlink/Screens/Profile/my_plan_screen.dart';
import 'package:fitlink/Screens/Profile/plan_temp.dart';
import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({Key? key}) : super(key: key);

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  List<String> Splans = [
    'Strenght Plan by Ze Gregorio',
    'Cut season ',
  ];

  List<String> Yplans = [
    'My plan #1',
  ];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final FirebaseAuth auth = FirebaseAuth.instance;
    String currentUser = auth.currentUser!.uid;

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 8),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: <Widget>[
            // Custom Bar
            Container(
              margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Workout",
                          style: kTitleTextStyle2,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        //print("back");
                        Navigator.pop(context);
                      },
                      child: const Icon(LineAwesomeIcons.times)),
                ],
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              height: kSpacingUnit.w * 5.5,
              margin:
                  EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(
                bottom: kSpacingUnit.w * 2,
              ),
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSpacingUnit.w * 2),
                  color: Theme.of(context).backgroundColor),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: kSpacingUnit.w * 2.5,
                  ),
                  Text(
                    "Specialized Plans",
                    style: kCaptionTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  //Icon(LineAwesomeIcons.sms, size: kSpacingUnit.w * 2.5,),
                ],
              ),
            ),
            // lista de planos
            ListView.builder(
                padding: const EdgeInsets.only(left: 70),
                shrinkWrap: true,
                itemCount: Splans.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Text(Splans[index] + "\n"),
                    onTap: () {
                      print("olaaaaaa" + Splans[index]);
                    },
                  );
                }),
            Container(
              margin: const EdgeInsets.only(left: 130, right: 130, top: 20),
              child: ElevatedButton(
                onPressed: () {
                  print("exists");
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PlanT()),
                  );

                  //DatabaseService(uid: currentUser).getPTplans();
                },
                child: const Text(
                  'Check plan',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 207, 97, 134)),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(15)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 207, 97, 134)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 207, 97, 134))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: kSpacingUnit.w * 5.5,
              margin:
                  EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(
                bottom: kSpacingUnit.w * 2,
              ),
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kSpacingUnit.w * 2),
                  color: Theme.of(context).backgroundColor),
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: kSpacingUnit.w * 2.5,
                  ),
                  Text(
                    "Your Plans",
                    style: kCaptionTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  //Icon(LineAwesomeIcons.sms, size: kSpacingUnit.w * 2.5, ),
                ],
              ),
            ),
            // lista de planos
            ListView.builder(
                padding: const EdgeInsets.only(left: 70),
                shrinkWrap: true,
                itemCount: Yplans.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Text(Yplans[index] + "\n"),
                    onTap: () async {
                      if (await checkIfDocExists(currentUser)) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyPlan()));
                      } else {
                        Fluttertoast.showToast(
                            msg: "Please create a plan first!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.pink,
                            fontSize: 16.0);
                      }
                    },
                  );
                }),
            Container(
              margin: const EdgeInsets.only(left: 130, right: 130, top: 20),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MakePlan()));
                },
                child: const Text(
                  'Make a new plan  ',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 207, 97, 134)),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      const EdgeInsets.all(15)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 207, 97, 134)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: const BorderSide(
                            color: Color.fromARGB(255, 207, 97, 134))),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> checkIfDocExists(String docId) async {
    try {
      // Get reference to Firestore collection
      var collectionRef = FirebaseFirestore.instance.collection('userPlans');

      var doc = await collectionRef.doc(docId).get();
      return doc.exists;
    } catch (e) {
      throw e;
    }
  }
}
