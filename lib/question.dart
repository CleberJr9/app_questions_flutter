import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String text;

  Question(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
