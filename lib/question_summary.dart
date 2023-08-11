import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary(this.summaryData, {Key? key}) : super(key: key);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(5),
          child: Column(
            children: summaryData.map((data) {
              final int questionIndex = (data['question_index'] as int) + 1;
              final String correctAnswer = data['correct_answer'] as String;
              final String userAnswer = data['user_answer'] as String;
              final bool isAnswerCorrect = correctAnswer == userAnswer;

              Color circleColor = isAnswerCorrect
                  ? const Color.fromARGB(219, 110, 220, 228)
                  : const Color.fromARGB(220, 245, 104, 238);

              return Container(
                margin: const EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: circleColor,
                      radius: 12,
                      child: Text(
                        questionIndex.toString(),
                        style: const TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      //It takes the available space , it can't take more width tha the flex widget in this case which is ROW widget
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            data['question'] as String,
                            style: GoogleFonts.rubik(
                                color: const Color.fromARGB(220, 247, 247, 247),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            correctAnswer,
                            style: GoogleFonts.notoSans(
                              color: const Color.fromARGB(219, 197, 163, 234),
                            ),
                          ),
                          Text(
                            userAnswer,
                            style: GoogleFonts.notoSans(
                              color: const Color.fromARGB(219, 168, 241, 248),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
