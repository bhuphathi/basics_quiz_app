import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color(0xFFCE9ED8),
          ),
          const SizedBox(
            height: 80,
          ),
          const Text(
            "Learn Flutter the fun way!",
            style: TextStyle(fontSize: 24, color: Color(0xFFCE9ED8)),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xFFCE9ED8),
                side: const BorderSide(color: Colors.grey)),
            onPressed: startQuiz,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz"),
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
