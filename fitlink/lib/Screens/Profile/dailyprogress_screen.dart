import 'package:fitlink/Screens/Profile/journaling.dart';
import 'package:fitlink/Screens/Profile/nut_plan.dart';
import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class DailyProgress extends StatefulWidget {
  DailyProgress({Key? key}) : super(key: key);

  @override
  State<DailyProgress> createState() => _DailyProgressState();
}

class _DailyProgressState extends State<DailyProgress> {
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
              margin: EdgeInsets.only(left: 16,right: 16,top: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      print("back");
                      Navigator.pop(context);
                    },
                    child: Icon(LineAwesomeIcons.angle_left)
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text("Daily Progress", style: kTitleTextStyle2,),
                      ],
                    ),
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
            Container(
              height: kSpacingUnit.w * 5.5,
              margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(bottom: kSpacingUnit.w * 2,),
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                color: Theme.of(context).backgroundColor
              ),
              child: Row(
                children: <Widget>[
                  Icon(LineAwesomeIcons.check_square, size: kSpacingUnit.w * 2.5,
                  ),
                  SizedBox(width: kSpacingUnit.w*2.5,),
                  Text("Workout of the day", style: kCaptionTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    ),
                    ),
                    Spacer(),
                      Icon(LineAwesomeIcons.angle_right, size: kSpacingUnit.w * 2.5,
                      ),
                ],
              ),
            ), 
            Container(
              height: kSpacingUnit.w * 5.5,
              margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(bottom: kSpacingUnit.w * 2,),
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                color: Theme.of(context).backgroundColor
              ),
              child: Row(
                children: <Widget>[
                  Icon(LineAwesomeIcons.fruit_apple, size: kSpacingUnit.w * 2.5,
                  ),
                  SizedBox(width: kSpacingUnit.w*2.5,),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlanNUT()),
                              );
                    },
                    child: Text("Eat following program", style: kCaptionTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      ),
                      ),
                  ),
                    Spacer(),
                      Icon(LineAwesomeIcons.angle_right, size: kSpacingUnit.w * 2.5,
                      ),
                ],
              ),
            ), 
            Container(
              height: kSpacingUnit.w * 5.5,
              margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(bottom: kSpacingUnit.w * 2,),
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                color: Theme.of(context).backgroundColor
              ),
              child: Row(
                children: <Widget>[
                  Icon(LineAwesomeIcons.user_check, size: kSpacingUnit.w * 2.5,
                  ),
                  SizedBox(width: kSpacingUnit.w*2.5,),
                  Text("Report to PT", style: kCaptionTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    ),
                    ),
                    Spacer(),
                      Icon(LineAwesomeIcons.angle_right, size: kSpacingUnit.w * 2.5,
                      ),
                ],
              ),
            ),
            Container(
              height: kSpacingUnit.w * 5.5,
              margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(bottom: kSpacingUnit.w * 2,),
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                color: Theme.of(context).backgroundColor
              ),
              child: Row(
                children: <Widget>[
                  Icon(LineAwesomeIcons.heartbeat, size: kSpacingUnit.w * 2.5,
                  ),
                  SizedBox(width: kSpacingUnit.w*2.5,),
                  InkWell(
                    onTap: () {
                       Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Journaling()),
                                    );
                    },
                    child: Text("Personal Journal", style: kCaptionTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                      ),
                      ),
                  ),
                    Spacer(),
                      Icon(LineAwesomeIcons.angle_right, size: kSpacingUnit.w * 2.5,
                      ),
                ],
              ),
            ),
            Container(
              height: kSpacingUnit.w * 5.5,
              margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(bottom: kSpacingUnit.w * 2,),
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                color: Theme.of(context).backgroundColor
              ),
              child: Row(
                children: <Widget>[
                  Icon(LineAwesomeIcons.bed, size: kSpacingUnit.w * 2.5,
                  ),
                  SizedBox(width: kSpacingUnit.w*2.5,),
                  Text("7-9 Hours of sleep", style: kCaptionTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    ),
                    ),
                    Spacer(),
                      Icon(LineAwesomeIcons.angle_right, size: kSpacingUnit.w * 2.5,
                      ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}