import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'front_screen.dart';

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  List<String> selectedAnswer = [];
  var activescreen = 'front-screen';
  void switchscreen() {
    setState(() {
      activescreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswer.add(answer);

    if (selectedAnswer.length == questions.length) {
      setState(() {
        activescreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activescreen = 'front-screen';
      selectedAnswer = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = Frontscreen(switchscreen);
    if (activescreen == 'question-screen') {
      screenWidget = QuestionScreen(chooseAnswer);
    }
    if (activescreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswer: selectedAnswer,
        restart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 114, 61, 237),
                Color.fromARGB(255, 38, 13, 74),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
