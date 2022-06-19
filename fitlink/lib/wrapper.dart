import 'package:fitlink/Screens/Profile/home_screen.dart';
import 'package:fitlink/Screens/Welcome/welcome_screen.dart';
import 'package:fitlink/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/myuser.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<MyUser?>(
        stream: authService.user,
        builder: (_, AsyncSnapshot<MyUser?> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final MyUser? user = snapshot.data;
            return user == null ? const WelcomeScreen() : const HomeScreen();
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
