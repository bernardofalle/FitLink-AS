import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/Screens/Profile/dailyprogress_screen.dart';
import 'package:fitlink/Screens/Profile/journaling.dart';
import 'package:fitlink/Screens/Profile/nut_plan.dart';
import 'package:fitlink/Screens/Profile/profile_screen.dart';
import 'package:fitlink/Screens/Profile/talkwithcoaches_screen.dart';
import 'package:fitlink/Screens/Profile/workout_screen.dart';
import 'package:fitlink/constants.dart';
import 'package:fitlink/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    DocumentReference mainDB =
        FirebaseFirestore.instance.collection('mainDB').doc(currentUser!.uid);

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
                  GestureDetector(
                      onTap: () {
                        print("drawer");
                      },
                      child: const Icon(LineAwesomeIcons.bars)),
                  InkWell(
                    child: Container(
                      // ir para o profile
                      height: 59,
                      width: 59,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                            image: AssetImage("assets/images/avatar.jfif")),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
            // card section
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Hello, ', style: kTitleTextStyle2),
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
                      if (snapshot.connectionState == ConnectionState.done) {
                        Map<String, dynamic> data =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Text(
                          "${data['name']}",
                          style: kTitleTextStyle2,
                          textAlign: TextAlign.center,
                        );
                      }

                      return const Text("loading");
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              width: 370,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16, right: 6),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      margin:
                          const EdgeInsets.only(bottom: 10, right: 10, left: 5),
                      height: 200,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.grey,
                      ),
                      child: InkWell(
                        onTap: (() {
                          print("TA A DAR IR PARA O PROXIMO ECRA CRL");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DailyProgress()),
                          );
                        }),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 30,
                              top: 20,
                              child: Text(
                                "Daily progress",
                                style: GoogleFonts.inter(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: kLightPrimaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Categories', style: kTitleTextStyle2),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 185,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16, right: 6),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10, right: 10),
                          height: 185,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey,
                          ),
                          child: InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WorkoutScreen()),
                              );
                            }),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 10,
                                  top: 20,
                                  child: Text(
                                    "Workout Plan",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: kLightPrimaryColor,
                                    ),
                                  ),
                                ),
                                /* LinearPercentIndicator(
                              lineHeight: 40,
                              percent: 33,
                              progressColor: Colors.deepPurple,
                              backgroundColor: Colors.deepPurple.shade200,
                            ),*/
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Container(
                  height: 200,
                  width: 185,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16, right: 6),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10, right: 10),
                          height: 185,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey,
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TalkWithCoaches()),
                              );
                            },
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 10,
                                  top: 20,
                                  child: Text(
                                    "Talk with\nCoaches",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: kLightPrimaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 185,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16, right: 6),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10, right: 10),
                          height: 185,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey,
                          ),
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                left: 10,
                                top: 20,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Journaling()),
                                    );
                                  },
                                  child: Text(
                                    "Journaling",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: kLightPrimaryColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  height: 200,
                  width: 185,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16, right: 6),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10, right: 10),
                          height: 185,
                          width: 170,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey,
                          ),
                          child: InkWell(
                            onTap: (() {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlanNUT()),
                              );
                            }),
                            child: Stack(
                              children: <Widget>[
                                Positioned(
                                  left: 10,
                                  top: 20,
                                  child: Text(
                                    "Eating",
                                    style: GoogleFonts.inter(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: kLightPrimaryColor,
                                    ),
                                  ),
                                ),
                                /* LinearPercentIndicator(
                              lineHeight: 40,
                              percent: 33,
                              progressColor: Colors.deepPurple,
                              backgroundColor: Colors.deepPurple.shade200,
                            ),*/
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
