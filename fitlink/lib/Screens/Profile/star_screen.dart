import 'package:fitlink/Screens/Profile/picknutritionist.dart';
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
              child: TextButton(
                onPressed: () {
                  print("?REMIUM");
                },
                child: const Text(
                  'Upgrade to Premium',
                  style: const TextStyle(color: Colors.white),
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
                            color: const Color.fromARGB(255, 207, 97, 134))),
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
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PickNutriScreen()),
                      );
                    },
                    child: Text(
                      "Pick a Nutricionist",
                      style: kCaptionTextStyle.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  //Icon(LineAwesomeIcons.sms, size: kSpacingUnit.w * 2.5,),
                ],
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
                  const Spacer(),
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
