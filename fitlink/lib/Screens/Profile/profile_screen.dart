import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/Screens/Profile/home_screen.dart';
import 'package:fitlink/Screens/Profile/star_screen.dart';
import 'package:fitlink/constants.dart';
import 'package:fitlink/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'package:fitlink/services/auth.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    User? currentUser = auth.currentUser;
    final authService = Provider.of<AuthService>(context);
    DocumentReference mainDB =
        FirebaseFirestore.instance.collection('mainDB').doc(currentUser!.uid);

    ScreenUtil.init(context);

    var profileInfo = Expanded(
      child: Column(
        children: [
          Container(
            height: kSpacingUnit.w * 10,
            width: kSpacingUnit.w * 10,
            margin: EdgeInsets.only(top: kSpacingUnit.w * 3),
            child: Stack(
              children: [
                CircleAvatar(
                  radius: kSpacingUnit.w * 5,
                  backgroundImage:
                      const AssetImage("assets/images/avatar.jfif"),
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
          SizedBox(
            height: kSpacingUnit.w * 2,
          ),
          SizedBox(
            height: kSpacingUnit.w * 0.5,
          ),
          FutureBuilder<DocumentSnapshot>(
            future: mainDB.get(),
            builder: (BuildContext context,
                AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return const Text("Something went wrong");
              }

              if (snapshot.hasData && !snapshot.data!.exists) {
                return const Text("Document does not exist");
              }

              if (snapshot.connectionState == ConnectionState.done) {
                Map<String, dynamic> data =
                    snapshot.data!.data() as Map<String, dynamic>;
                return Text("${data['name']}", style: kTitleTextStyle);
              }

              return const Text("loading");
            },
          ),
          Text(
            currentUser.email!,
            style: kCaptionTextStyle,
          ),
          SizedBox(
            height: kSpacingUnit.w * 2.4,
          ),
          Container(
            height: kSpacingUnit.w * 4,
            width: kSpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                "Edit Profile",
                style: kButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );

    var header = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: kSpacingUnit.w * 3,
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            LineAwesomeIcons.arrow_left,
            size: ScreenUtil().setSp(kSpacingUnit.w * 3),
          ),
        ),
        profileInfo,
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => StarScreen()),
              );
            },
            icon: Icon(
              LineAwesomeIcons.star,
              size: ScreenUtil().setSp(kSpacingUnit.w * 3),
            )),
        SizedBox(
          width: kSpacingUnit.w * 3,
        ),
      ],
    );

    return Scaffold(
      backgroundColor: kDarkPrimaryColor,
      body: Column(
        children: <Widget>[
          SizedBox(
            height: kSpacingUnit.w * 5,
          ),
          header,
          Expanded(
            child: ListView(
              children: <Widget>[
                const ProfileListItem(
                  icon: LineAwesomeIcons.bell,
                  text: 'Notifications',
                ),
                const ProfileListItem(
                  icon: LineAwesomeIcons.dumbbell,
                  text: 'Coaches',
                ),
                const ProfileListItem(
                  icon: LineAwesomeIcons.user_friends,
                  text: 'Invite Link',
                ),
                Container(
                    child: InkWell(
                        onTap: () {
                          authService.signOut();
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.logout))),
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
      margin: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 4).copyWith(
        bottom: kSpacingUnit.w * 2,
      ),
      padding: EdgeInsets.symmetric(horizontal: kSpacingUnit.w * 2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpacingUnit.w * 3),
          color: Theme.of(context).backgroundColor),
      child: Row(
        children: <Widget>[
          Icon(
            this.icon,
            size: kSpacingUnit.w * 2.5,
          ),
          SizedBox(
            width: kSpacingUnit.w * 2.5,
          ),
          Text(
            this.text,
            style: kTitleTextStyle.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (this.hasNavigation)
            Icon(
              LineAwesomeIcons.angle_right,
              size: kSpacingUnit.w * 2.5,
            ),
        ],
      ),
    );
  }
}
