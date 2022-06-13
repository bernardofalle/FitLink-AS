import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class PickPersonalScreen extends StatefulWidget {
  PickPersonalScreen({Key? key}) : super(key: key);

  @override
  State<PickPersonalScreen> createState() => _PickPersonalScreenState();
}

class _PickPersonalScreenState extends State<PickPersonalScreen> {
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
                          "Pick a Personal Trainer",
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
          ],
        ),
      ),
    );
  }
}
