import 'package:flutter/material.dart';
import 'package:adv_app/data/questions.dart';
import 'package:adv_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });
  final void Function() onRestart;
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
    return summary;
  }

  @override
  Widget build(contest) {
    final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    final numCorrectQuestion =
        summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
        }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You Answered $numCorrectQuestion out of $numTotalQuestion questions!",
            ),
            const SizedBox(height: 30),
            QuestionSummary(summaryData),
            const SizedBox(height: 30),
            TextButton(onPressed: onRestart, child: Text("Restart Quiz")),
          ],
        ),
      ),
    );
  }
}
