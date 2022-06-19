import 'package:fitlink/Screens/Welcome/register.dart';
import 'package:fitlink/Screens/Welcome/sign_in.dart';
import 'package:fitlink/Screens/Welcome/welcome_screen.dart';
import 'package:fitlink/constants.dart';
import 'package:fitlink/services/auth.dart';
import 'package:fitlink/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Auth',
        theme: kDarkTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => const Wrapper(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen()
        },
      ),
    );
  }
}
