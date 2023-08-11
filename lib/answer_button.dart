import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.answer, required this.onTap, super.key});
  final String answer;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 85, 83, 95),
            foregroundColor: const Color.fromARGB(255, 202, 215, 236),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30)),
        child: Text(answer, textAlign: TextAlign.center),
      ),
    );
  }
}
