import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class TalkWithCoaches extends StatefulWidget {
  TalkWithCoaches({Key? key}) : super(key: key);

  @override
  State<TalkWithCoaches> createState() => _TalkWithCoachesState();
}

class _TalkWithCoachesState extends State<TalkWithCoaches> {
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
                  Container(
                    child: Row(
                      children: [
                        Text("Talk with coaches", style: kTitleTextStyle2,),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      print("back");
                      Navigator.pop(context);
                    },
                    child: Icon(LineAwesomeIcons.times)
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
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
                  SizedBox(width: kSpacingUnit.w*2.5,),
                  Text("Zé Gregório", style: kCaptionTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    ),
                    ),
                    Spacer(),
                      Icon(LineAwesomeIcons.sms, size: kSpacingUnit.w * 2.5,
                      ),
                ],
              ),
            ),
            SizedBox(height: 50,),
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
                  SizedBox(width: kSpacingUnit.w*2.5,),
                  Text("Sérgio Veloso", style: kCaptionTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    ),
                    ),
                    Spacer(),
                      Icon(LineAwesomeIcons.sms, size: kSpacingUnit.w * 2.5,
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