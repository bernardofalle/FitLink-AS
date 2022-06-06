import 'package:fitlink/Screens/Profile/profile_screen.dart';
import 'package:fitlink/Screens/Welcome/components/background.dart';
import 'package:fitlink/components/rounded_button.dart';
import 'package:fitlink/constants.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset("assets/icons/fitLogin.png",
            height: size.height * 0.2,
            width: size.width * 0.5,
            scale: 0.1,
            ), 
            SizedBox(height: size.height * 0.1,  // espaço entre imagem e fitlink
            ),
            Text(
            "FitLink™",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 30),
          ),
          RoundedButton(
            text: "Sign up",
            press: () {}, 
          ),
          RoundedButton(
            text: "Sign in with Email",
            color: kPrimaryLightColor,
            textColor: Colors.black,
            press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()),
                );
              }
          ),
          ],
          ),
      ),
    );
  }
}
