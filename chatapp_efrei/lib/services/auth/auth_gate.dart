import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          return const Center(child: Homepage());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Something Went Wrong'));
        } else {
          return const Center(child: Text('User Not Logged In'));
        }
      },
    ));
  }
}
