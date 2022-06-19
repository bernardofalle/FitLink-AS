import 'package:fitlink/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController pwController = TextEditingController();

    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: pwController,
              decoration: const InputDecoration(
                labelText: "Password",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              dynamic result = await authService.signInWithEmailAndPassword(
                  emailController.text, pwController.text);
              if (result == null) {
                print('cant login');
              } else {
                Navigator.pop(context);
              }
            },
            child: const Text("LogIn"),
          ),
          InkWell(
            onTap: () {
                Navigator.pushNamed(context, '/register');
            },
            child: Container(
          
                child: Text("Have no accout? Register here.",style: TextStyle(decoration: TextDecoration.underline),),
            ),
          ),

        ],
      ),
    );
  }
}
