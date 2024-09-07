import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
      {super.key, required this.option, required this.buttonFunction});

  final void Function() buttonFunction;
  final String option;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 22),
        ),
        onPressed: buttonFunction,
        child: Text(option, textAlign: TextAlign.center),
      ),
    );
  }
}
