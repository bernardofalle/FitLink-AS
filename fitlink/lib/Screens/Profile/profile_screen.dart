import 'package:fitlink/Screens/Profile/home_screen.dart';
import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    
    var profileInfo = Expanded(
                child: Column(
                  children: [
                  Container(
                    height: kSpacingUnit.w * 10,
                    width: kSpacingUnit.w * 10,
                    margin: EdgeInsets.only(top: kSpacingUnit.w*3),
                    child: Stack(
                      children: [
                        CircleAvatar(
                        radius: kSpacingUnit.w * 5,
                        backgroundImage: AssetImage("assets/images/avatar.jfif"),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          height: kSpacingUnit.w * 2.5,
                          width: kSpacingUnit.w * 2.5,
                          decoration: BoxDecoration(
                            color: Theme.of(context).accentColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: Icon(
                              LineAwesomeIcons.pen, 
                              color: kDarkPrimaryColor,
                              size: ScreenUtil().setSp(kSpacingUnit.w * 1.5),
                              ),
                              onPressed: () { 
                                  print("ollaaaaa");
                                  /*Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => HomeScreen()),
                                  );*/
                               },
                          ),
                        ),
                      )
                      ],
                    ),
                  ),
                  SizedBox(height: kSpacingUnit.w*2,),
                  Text("Catarina Jorge", style: kTitleTextStyle,),
                  SizedBox(height: kSpacingUnit.w*0.5,),
                  Text("catarinaj@gmail.com", style: kCaptionTextStyle,),
                  SizedBox(height: kSpacingUnit.w*2.4,),
                  Container(
                    height: kSpacingUnit.w * 4,
                    width: kSpacingUnit.w * 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
                      color: Theme.of(context).accentColor,
                    ),
                    child: Center(
                      child: Text("Edit Profile", style: kButtonTextStyle,),
                    ),
                  ),
                  ],
                ),
              );
    
    var header = Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: kSpacingUnit.w*3,),
              IconButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                icon: Icon(LineAwesomeIcons.arrow_left, size: ScreenUtil().setSp(kSpacingUnit.w * 3),),),
              profileInfo,
              Icon(LineAwesomeIcons.sun, size: ScreenUtil().setSp(kSpacingUnit.w * 3),),
              SizedBox(width: kSpacingUnit.w*3,),
            ],
          );
    
    return Scaffold(
      backgroundColor: kDarkPrimaryColor,
      body: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit.w * 5,),
          header,
          Expanded(
            child: ListView(
               children: <Widget>[
                 ProfileListItem(
                   icon: LineAwesomeIcons.bell,
                   text: 'Notifications',
                 ),
                  ProfileListItem(
                   icon: LineAwesomeIcons.dumbbell,
                   text: 'Coaches',
                 ),
                  ProfileListItem(
                   icon: LineAwesomeIcons.user_friends,
                   text: 'Invite Link',
                 ),
               ],
            ),
          ),
        ],  
      ),
    );
  }
}

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final text;
  final bool hasNavigation;

  const ProfileListItem({
    Key? key, 
    required this.icon, 
    this.text, 
    this.hasNavigation = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kSpacingUnit.w * 5.5,
      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(bottom: kSpacingUnit.w * 2,),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
        color: Theme.of(context).backgroundColor
      ),
      child: Row(
        children: <Widget>[
          Icon(this.icon, size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(width: kSpacingUnit.w*2.5,),
          Text(this.text, style: kTitleTextStyle.copyWith(
            fontWeight: FontWeight.w500,
            ),
            ),
            Spacer(),
            if (this.hasNavigation)
              Icon(LineAwesomeIcons.angle_right, size: kSpacingUnit.w * 2.5,
              ),
        ],
      ),
    );
  }
}