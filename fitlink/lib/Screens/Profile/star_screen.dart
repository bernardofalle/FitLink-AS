import 'package:fitlink/Screens/Profile/pickpersonaltrainer.dart';
import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class StarScreen extends StatefulWidget {
  StarScreen({Key? key}) : super(key: key);

  @override
  State<StarScreen> createState() => _StarScreenState();
}

class _StarScreenState extends State<StarScreen> {
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
                          "",
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
            SizedBox(
              height: 100,
            ),
            Container(
              height: kSpacingUnit.w * 5.5,
              margin:
                  EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(
                bottom: kSpacingUnit.w * 2,
              ),
              child: TextButton(
                onPressed: () {
                  print("?REMIUM");
                },
                child: Text(
                  'Upgrade to Premium',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Color.fromARGB(255, 207, 97, 134)),
                  padding:
                      MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                  foregroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 207, 97, 134)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(
                            color: Color.fromARGB(255, 207, 97, 134))),
                  ),
                ),
              ),
            ),
            SizedBox(
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
                  InkWell(
                    onTap: () {
                      print("nutricionist");
                    },
                    child: Text(
                      "Pick a Nutricionist",
                      style: kCaptionTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  //Icon(LineAwesomeIcons.sms, size: kSpacingUnit.w * 2.5,),
                ],
              ),
            ),
            SizedBox(
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PickPersonalScreen()),
                      );
                    },
                    child: Text(
                      "Pick a Personal Trainer",
                      style: kCaptionTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Spacer(),
                  //Icon(LineAwesomeIcons.sms, size: kSpacingUnit.w * 2.5, ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
