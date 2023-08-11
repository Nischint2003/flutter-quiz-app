import 'package:flutter/material.dart';
import 'package:quiz_app/front_text.dart';

class Frontscreen extends StatelessWidget {
  const Frontscreen(this.startQuiz, {super.key});
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //adding image
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 200,
            color: const Color.fromARGB(154, 253, 253, 253),
          ),
          const SizedBox(height: 80), // space between image and text
          style_text("Learn Flutter the fun way!"), //calling style function
          const SizedBox(height: 45), // space between text and button
          // button
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              /*padding: const EdgeInsets.only(
                top: 30,
              ),*/
              foregroundColor: Colors.white,
              backgroundColor: const Color.fromARGB(153, 214, 210, 210),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.italic),
            ),
          )
        ],
      ),
    );
  }
}
