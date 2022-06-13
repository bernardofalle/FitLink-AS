import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class WorkoutScreen extends StatefulWidget {
  WorkoutScreen({Key? key}) : super(key: key);

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
    'My plan #2',
  ];

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
                        Text("Workout", style: kTitleTextStyle2,),
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
              height: 100,
            ),
            Container(
              height: kSpacingUnit.w * 5.5,
              margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(bottom: kSpacingUnit.w * 2,),
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 2),
                color: Theme.of(context).backgroundColor
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: kSpacingUnit.w*2.5,),
                  Text("Specialized Plans", style: kCaptionTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    ),
                    ),
                    Spacer(),
                      //Icon(LineAwesomeIcons.sms, size: kSpacingUnit.w * 2.5,),
                ],
              ),
            ),
                // lista de planos
            ListView.builder(
              padding: EdgeInsets.only(left: 70),
              shrinkWrap: true,
              itemCount: Splans.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  child: Text(Splans[index]+"\n"),
                  onTap: () {
                    print("olaaaaaa"+Splans[index]);
                  },
                );
              }
              ),
            Container(
              margin: EdgeInsets.only(left: 130, right: 130,top: 20),
              child: TextButton(onPressed: () { 
                print("book a new plan");
               },
              child: Text(
                'Book a new plan  ',
                style: TextStyle(color: Colors.white),             
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 207, 97, 134)),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 207, 97, 134)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromARGB(255, 207, 97, 134))
              ),
              ),
              ),
              ),
            ),
            SizedBox(height: 25,),
            Container(
              height: kSpacingUnit.w * 5.5,
              margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(bottom: kSpacingUnit.w * 2,),
              padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kSpacingUnit.w * 2),
                color: Theme.of(context).backgroundColor
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: kSpacingUnit.w*2.5,),
                  Text("Your Plans", style: kCaptionTextStyle.copyWith(
                    fontWeight: FontWeight.w500,
                    ),
                    ),
                    Spacer(),
                      //Icon(LineAwesomeIcons.sms, size: kSpacingUnit.w * 2.5, ),
                ],
              ),
            ),
                            // lista de planos
            ListView.builder(
              padding: EdgeInsets.only(left: 70),
              shrinkWrap: true,
              itemCount: Yplans.length,
              itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  child: Text(Yplans[index]+"\n"),
                  onTap: () {
                    print("olaaaaaa"+Yplans[index]);
                  },
                );
              }
              ),
              Container(
              margin: EdgeInsets.only(left: 130, right: 130,top: 20),
              child: TextButton(onPressed: () { 
                print("Make a new plan");
               },
              child: Text(
                'Make a new plan  ',
                style: TextStyle(color: Colors.white),             
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 207, 97, 134)),
                padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15)),
                foregroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 207, 97, 134)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Color.fromARGB(255, 207, 97, 134))
              ),
              ),
              ),
              ),
            ),
          ],
      ),
      ),
    );
  }
}