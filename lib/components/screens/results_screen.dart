import 'package:adv_basics/data/questions.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.selectedAnswers, required this.reset});

  final List<String> selectedAnswers;
  final void Function() reset;

  List<Map<String, Object>> get resultSummary {
    List<Map<String, Object>> resultSummaryArr = [];
    var correct = false, cnt = 0;

    for (var i = 0; i < selectedAnswers.length; i++) {
      if (questions[i].answers[0] == selectedAnswers[i]) {
        correct = true;
        cnt++;
      } else {
        correct = false;
      }

      resultSummaryArr.add({
        "qno": i + 1,
        "question": questions[i].question,
        "answer": questions[i].answers[0],
        "selected": selectedAnswers[i],
        "correct": correct,
        "noofcorrect": cnt,
      });
    }
    return resultSummaryArr;
  }

  // final List<String> entries = <String>['A', 'B', 'C'];
  // final List<int> colorCodes = <int>[600, 500, 100];

  @override
  Widget build(context) {

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ListView(
          //   shrinkWrap: true,
          //   padding: const EdgeInsets.all(8),
          //   children: [
          //     ...selectedAnswers.map(
          //       (answers) => Container(
          //         padding: const EdgeInsets.all(2.0),
          //         margin: const EdgeInsets.symmetric(vertical: 5),
          //         alignment: Alignment.center,
          //         height: 50,
          //         color: Colors.amber[600],
          //         child: Text(
          //           answers,
          //           // textAlign: TextAlign.center,
          //           style: const TextStyle(
          //             color: Colors.white,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          Text(
            "You answered ${resultSummary.last["noofcorrect"]} out of ${resultSummary.length} questions",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 270,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ...resultSummary.map(
                    (summary) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: summary["correct"] as bool
                                  ? Colors.green
                                  : Colors.red,
                              borderRadius: BorderRadius.circular(200),
                            ),
                            child: Text(
                              "${summary["qno"]}.",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  summary["question"] as String,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  summary["answer"] as String,
                                  style: const TextStyle(
                                    color: Colors.lightGreen,
                                  ),
                                ),
                                Text(
                                  summary["selected"] as String,
                                  style: const TextStyle(
                                    color: Colors.white60,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          TextButton.icon(
            onPressed: () {
              selectedAnswers.clear();
              reset();
            },
            style: TextButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.replay),
            label: const Text("Restart Quiz"),
          ),
        ],
      ),
    );
  }
}
