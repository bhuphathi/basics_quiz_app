import 'package:adv_basics/components/buttons/answer_button.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
    required this.startScreen,
  });

  final Function() startScreen;
  final Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currQuestionindex = 0;

  void answerQuestion(String selecetedAnswer) {
    setState(() {
      currQuestionindex++;
    });
    widget.onSelectAnswer(selecetedAnswer);
  }

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 200,
          ),
          Text(
            questions[currQuestionindex].question,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ...questions[currQuestionindex].getShuffledAnswers().map(
                (answer) => Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    AnswerButton(
                      answer: answer,
                      onBtnPressed: () {
                        answerQuestion(answer);
                      },
                    ),
                  ],
                ),
              ),
        ],
      ),
    );
  }
}
