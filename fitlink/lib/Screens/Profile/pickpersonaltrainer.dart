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
            Container(
              margin: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 170.0,
                      height: 220.0,
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
                    Container(
                      width: 170.0,
                      height: 220.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.black38,
                      ),
                      child: InkWell(
                        onTap: () {
                          print("Larry");
                        },
                        child: Image(image: AssetImage("assets/images/larry.jpg",),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
            Container(
              margin: EdgeInsets.only(left: 70),
              child: Row(
                children: <Widget>[
                  Text('Zé Gregório'),
                  SizedBox(width: 110,),
                  Text('Larry Wheels'),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    Container(
                      width: 170.0,
                      height: 220.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.black38,
                      ),
                      child: InkWell(
                        onTap: () {
                          print("Jeff");
                        },
                        child: Image(image: AssetImage("assets/images/jeff.jpg"),))
                    ),
                    SizedBox(width: 30,),
                    Container(
                      width: 170.0,
                      height: 220.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.black38,
                      ),
                      child: InkWell(
                        onTap: () {
                          print("Chrisss");
                        },
                        child: Image(image: AssetImage("assets/images/chris.jpg",),
                        ),
                      ),
                    ),
                  ],
                ),
            ),
            Container(
              margin: EdgeInsets.only(left: 70),
              child: Row(
                children: <Widget>[
                  Text('Jeff Nippard'),
                  SizedBox(width: 110,),
                  Text('Chris Heria'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
