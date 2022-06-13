import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ZeGregScreen extends StatefulWidget {
  ZeGregScreen({Key? key}) : super(key: key);

  @override
  State<ZeGregScreen> createState() => _ZeGregScreenState();
}

class _ZeGregScreenState extends State<ZeGregScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 8),
        child: ListView(
          physics: ClampingScrollPhysics(),
          children: <Widget>[
            // Custom Bar
            Container(
              margin: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "Personal Trainer",
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
            ),
            Container(
              margin: EdgeInsets.only(left: 45,right: 15,top: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 320.0,
                      height: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.black38,
                      ),
                      child: InkWell(
                        onTap: () {
                          print("ze");
                        },
                        child: Image(image: AssetImage("assets/images/zegregorio.png"),))
                    ),
                    SizedBox(width: 30,),
                  ],
                ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50,top: 20),
              child: Row(
                children: <Widget>[
                  Text('Zé Gregório',style: kTitleTextStyle2),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50,top: 20),
              child: Row(
                children: <Widget>[
                    Text('Strongman, Crossfit and Powerlifting Athlete.\nMain specialization as a coach: Strength Gain.',),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
