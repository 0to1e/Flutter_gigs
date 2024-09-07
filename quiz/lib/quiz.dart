import 'package:flutter/material.dart';
import 'package:quiz/Components/question_screen.dart';
import 'package:quiz/Components/quiz_gradient_container.dart';
import 'package:quiz/Components/splash_screen.dart';
import 'package:quiz/Models/question_data.dart';
import 'package:quiz/Components/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;
  List<Map<String, Object>> response = [];

// Instead of defining the widget itself in the variable , we can string to identify the current screen and then use ternary or conditional statements to render the screen conditionally which wouldn't require initstate
  @override
  void initState() {
    activeScreen =
        GradientContainer(widget: SplashScreen(stateFunction: switchScreen));
    super.initState();
  }

  void switchScreen() {
    response = [];
    setState(() {
      activeScreen = QuestionsScreen(saveAnswer: saveSelectedAnswer);
    });
  }

  void saveSelectedAnswer(int currentQuestion, String question, String selectedAnswer) {
    response.add({
      "questionNumber": currentQuestion+1,
      "question": question,
      "response": selectedAnswer,
      "correctAnswer": questions[currentQuestion].answers[0]
    });

    if (currentQuestion == questions.length-1) {
      setState(() {
        activeScreen = GradientContainer(
            widget:
                ResultsScreen(results: response, stateFunction: switchScreen));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: activeScreen,
      ),
    );
  }
}
