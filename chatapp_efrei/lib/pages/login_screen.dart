import 'package:chatapp_efrei/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  void signIn() {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      authService.signInWithEmailAndPassword(_email.text, _password.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.toString()),
        ),
      );
    }
  }

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
              LoginField(hintText: 'Email', controller: _email),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Password',
                ob: true,
                controller: _password,
              ),
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
