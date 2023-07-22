import 'package:adv_basics/components/screens/questions_screen.dart';
import 'package:adv_basics/components/screens/results_screen.dart';
import 'package:adv_basics/components/screens/start_screen.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  final List<String> selectedAnswers = [];

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(
          selectedAnswers: selectedAnswers,
          reset: reset,
        );
      });
    }
  }

  void reset() {
    selectedAnswers.clear();
    setState(() {
      activeScreen = StartScreen(switchScreen);
    });
  }

  void switchScreen() {
    setState(() {
      activeScreen = activeScreen is StartScreen
          ? QuestionsScreen(
              startScreen: switchScreen,
              onSelectAnswer: chooseAnswer,
            )
          : StartScreen(switchScreen);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 44, 7, 107),
                Color.fromARGB(255, 95, 40, 189),
              ],
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: activeScreen,
          ),
        ),
      ),
    );
  }
}
