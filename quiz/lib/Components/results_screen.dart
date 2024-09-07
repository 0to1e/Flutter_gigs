import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/Components/quiz_gradient_container.dart';
import 'package:quiz/Components/result_card.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {required this.results, required this.stateFunction, super.key});

  final void Function() stateFunction;
  final List<Map<String, Object>> results;

  @override
  Widget build(BuildContext context) {
    final totalCorrectAnswers = results.where((response) {
      return response["response"] == response["correctAnswer"];
    }).length;

    return GradientContainer(
      widget: SizedBox(
        width: double.maxFinite,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 50),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Results",
                  style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(color: Colors.white, fontSize: 20),
                    "You have correctly answered $totalCorrectAnswers out of ${results.length} questions"),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SingleChildScrollView(
                        child: Column(
                            children: results.map((result) {
                          return ResultCard(
                            index: (result["questionNumber"] as int),
                            question: result["question"] != null
                                ? result["question"] as String
                                : "No question provided",
                            response: result["response"] != null
                                ? result["response"] as String
                                : "No response",
                            correct: result["correctAnswer"] != null
                                ? result["correctAnswer"] as String
                                : "No correct answer",
                          );
                        }).toList()),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                FilledButton.icon(
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 20)),
                    icon: const Icon(Icons.restart_alt),
                    onPressed: stateFunction,
                    label: const Text(
                      "Restart Quiz!",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
