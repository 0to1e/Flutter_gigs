import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key, required this.stateFunction});

  final void Function() stateFunction;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/images/quiz_images/quiz-logo.png",
            width: 300,
            color: const Color.fromARGB(142, 255, 255, 255),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text(
            "Learn Flutter the fun way !",
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 20)),
              onPressed: stateFunction,
              label: const Text(
                "Start Quiz",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ))
        ],
      ),
    );
  }
}
