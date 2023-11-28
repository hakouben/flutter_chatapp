import 'package:flutter/material.dart';

import '../widgets/login_field.dart';
import '../widgets/btn_deg.dart';

class LoginScreen extends StatefulWidget {
  final void Function()? on;
  const LoginScreen({
    Key? key,
    required this.on,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  void signup() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Sign in.',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              const SizedBox(height: 20),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              LoginField(hintText: 'Email'),
              const SizedBox(height: 15),
              LoginField(hintText: 'Password', ob: true),
              const SizedBox(height: 20),
              GradientButton(btntext: 'Sign in', ontap: () {}),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: widget.on,
                child: const Text(
                  'pas encore de compte ? créez en un',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 228, 223, 223)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
