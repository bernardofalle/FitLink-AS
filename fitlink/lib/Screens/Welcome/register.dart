import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitlink/services/auth.dart';
import 'package:fitlink/services/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController pwController = TextEditingController();
    final TextEditingController nameController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: "Name",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: pwController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              if (pwController.text.length < 6) {
                Fluttertoast.showToast(
                    msg: "Atleast 6 digits in password!",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.transparent,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
              if (emailController.text.contains("@") != true ||
                  emailController.text.contains(".") != true) {
                Fluttertoast.showToast(
                    msg: "Please use a valid email: ______@___.___",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.transparent,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                await authService.registerWithEmailAndPassword(
                  emailController.text,
                  pwController.text,
                );
                final FirebaseAuth auth = FirebaseAuth.instance;
                User? currentUser = auth.currentUser;
                await DatabaseService(uid: currentUser!.uid)
                    .updateUserName(nameController.text);
                Navigator.pop(context);
              }
            },
            child: Text("Register"),
          ),
        ],
      ),
    );
  }
}
