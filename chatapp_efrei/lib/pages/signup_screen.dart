import 'package:chatapp_efrei/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/login_field.dart';
import '../widgets/btn_deg.dart';

class SignupScreen extends StatefulWidget {
  final void Function() on;
  const SignupScreen({Key? key, required this.on}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmation = TextEditingController();
  Future<void> signUp() async {
    if (_password.text != _confirmation.text) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('passwords do not match'),
      ));
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signUpWithEmailAndPassword(_email.text, _password.text);
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
              LoginField(
                hintText: 'Email',
                ob: false,
                controller: _email,
              ),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'Password',
                ob: true,
                controller: _password,
              ),
              const SizedBox(height: 15),
              LoginField(
                hintText: 'confirm Password',
                ob: true,
                controller: _confirmation,
              ),
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
