import 'package:flutter/material.dart';
import 'package:adv_app/data/questions.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});
  final List<String> chosenAnswer;
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "correct_answer": questions[i].answers[0],
        "user_answer": chosenAnswer[i],
      });
    }
  }

  @override
  Widget build(contest) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("data"),
            const SizedBox(height: 30),
            const Text("list of answer and questions"),
            const SizedBox(height: 30),
            TextButton(onPressed: () {}, child: Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }
}
