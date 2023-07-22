import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.answer, required this.onBtnPressed});

  final String answer;
  final Function() onBtnPressed;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onBtnPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 36),
        backgroundColor: const Color.fromARGB(255, 39, 3, 70),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
      ),
      child: Text(
        answer,
        textAlign: TextAlign.center,
      ),
    );
  }
}
