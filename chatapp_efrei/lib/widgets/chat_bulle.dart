import 'package:flutter/material.dart';

class Chatbulle extends StatelessWidget {
  final String message;
  const Chatbulle({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: const Color(0xffb7dfca),
          borderRadius: BorderRadius.circular(12)),
      child: Text(
        message,
        style: const TextStyle(fontSize: 16, color: Color(0xff3b3635)),
      ),
    );
  }
}
