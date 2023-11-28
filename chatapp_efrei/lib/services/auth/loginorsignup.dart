import 'package:flutter/material.dart';
import 'package:chatapp_efrei/pages/signup_screen.dart';
import 'package:chatapp_efrei/pages/login_screen.dart';

class LoginorSignup extends StatefulWidget {
  const LoginorSignup({super.key});

  @override
  State<LoginorSignup> createState() => _LoginorSignupState();
}

class _LoginorSignupState extends State<LoginorSignup> {
  bool showLoginpage = true;
  void toggleView() {
    setState(() {
      showLoginpage = !showLoginpage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return LoginScreen(on: toggleView);
    } else {
      return SignupScreen(on: toggleView);
    }
  }
}
