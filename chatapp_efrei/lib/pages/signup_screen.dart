import 'package:flutter/material.dart';

import '../widgets/login_field.dart';
import '../widgets/btn_deg.dart';

class SignupScreen extends StatefulWidget {
  final void Function() on;
  const SignupScreen({Key? key, required this.on}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/signin_balls.png'),
              const Text(
                'Sign up',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                ),
              ),
              const SizedBox(height: 50),
              const SizedBox(height: 20),
              const SizedBox(height: 15),
              const SizedBox(height: 15),
              LoginField(hintText: 'Email', ob: false),
              const SizedBox(height: 15),
              LoginField(hintText: 'Password', ob: true),
              const SizedBox(height: 15),
              LoginField(hintText: 'confirm Password', ob: true),
              const SizedBox(height: 20),
              GradientButton(btntext: 'Sign up', ontap: () {}),
              const SizedBox(height: 40),
              GestureDetector(
                onTap: widget.on,
                child: const Text(
                  'tu as déjà un compte ? connecte toi',
                  style: TextStyle(
                      fontSize: 12, color: Color.fromARGB(255, 230, 227, 227)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
