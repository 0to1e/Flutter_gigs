import 'package:flutter/material.dart';
import 'package:quiz/Components/answer_button.dart';
import 'package:quiz/Components/quiz_gradient_container.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Models/question_data.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.saveAnswer, super.key});
  final void Function(int currentQuestion, String question, String selectedAnswer) saveAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestion = 0;

  void nextQuestion(String question, String selectedAnswer) {
    setState(() {
      widget.saveAnswer(currentQuestion ,question, selectedAnswer);
      currentQuestion++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
        widget: SizedBox(
      width: double.maxFinite,
      child: Container(
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestion].question,
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 35),
            ...questions[currentQuestion].shruflleAnswers().map((option) {
              return AnswerButton(
                  option: option,
                  buttonFunction: () {
                    nextQuestion(questions[currentQuestion].question, option);
                  });
            }),
          ],
        ),
      ),
    ));
  }
}
