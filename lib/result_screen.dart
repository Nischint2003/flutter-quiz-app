import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.restart});
  final List<String> chosenAnswer;
  final void Function() restart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestions questions out of $numTotalQuestions correctly!",
              style: GoogleFonts.firaSansExtraCondensed(
                fontSize: 20,
                color: const Color.fromARGB(232, 255, 255, 255),
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 25),
            QuestionSummary(summaryData),
            const SizedBox(height: 25),
            TextButton.icon(
              onPressed: restart,
              style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(224, 255, 255, 255)),
              icon: const Icon(Icons.refresh),
              label: const Text('Restart Quiz!'),
            ),
          ],
        ),
      ),
    );
  }
}
