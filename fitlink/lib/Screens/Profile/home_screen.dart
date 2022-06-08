import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Custom Bar
            Container(
              margin: EdgeInsets.only(left: 16,right: 16,top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      print("drawer");
                    },
                    child: Icon(LineAwesomeIcons.bars)
                  ),
                  Container(
                    height: 59,
                    width: 59,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(image: AssetImage("assets/images/avatar.jfif")),
                    ),
                  ),
                ],
              ),
            ),
            // card section
            SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Hello',style: kTitleTextStyle2),
                  Text('Catarina',style: kTitleTextStyle2,)
                ],
              ),
            ),
            Container(
              height: 200,
              width: 370,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.only(left: 16,right: 6),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10,right: 10,left: 5),
                      height: 200,
                      width: 370,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(28),
                        color: Colors.grey,
                      ),
                      child: InkWell(
                        onTap: (() {
                          print("TA A DAR IR PARA O PROXIMO ECRA CRL");
                        }),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              left: 30,
                              top: 20,
                              child: Text("Daily progress",style: GoogleFonts.inter(
                                fontSize: 30,
                                fontWeight: FontWeight.w700,
                                color: kLightPrimaryColor,
                              ),),
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
                  Text('Categories',style: kTitleTextStyle2),
                ],
              ),
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 16,right: 6),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10,right: 10),
                          height: 185,
                          width: 185,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey,
                          ),
                        child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 10,
                            top: 20,
                            child: Text("Workout Plan",style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kLightPrimaryColor,
                            ),),
                          ),
                         /* LinearPercentIndicator(
                            lineHeight: 40,
                            percent: 33,
                            progressColor: Colors.deepPurple,
                            backgroundColor: Colors.deepPurple.shade200,
                          ),*/
                        ],
                      ),
                        );
                  }),
                ),
                Container(
                  height: 200,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 16,right: 6),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10,right: 10),
                          height: 185,
                          width: 185,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey,
                          ),
                        child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 10,
                            top: 20,
                            child: Text("Talk with\nCoaches",style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kLightPrimaryColor,
                            ),
                            ),
                          ),
                        ],
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
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 16,right: 6),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10,right: 10),
                          height: 185,
                          width: 185,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey,
                          ),
                        child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 10,
                            top: 20,
                            child: Text("Journaling",style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kLightPrimaryColor,
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
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 16,right: 6),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(bottom: 10,right: 10),
                          height: 185,
                          width: 185,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            color: Colors.grey,
                          ),
                        child: Stack(
                        children: <Widget>[
                          Positioned(
                            left: 10,
                            top: 20,
                            child: Text("Eating",style: GoogleFonts.inter(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: kLightPrimaryColor,
                            ),
                            ),
                          ),
                        ],
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