import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  const ResultCard(
      {required this.index,
      required this.question,
      required this.response,
      required this.correct,
      super.key});

  final int index;
  final String question;
  final String response;
  final String correct;

  @override
  Widget build(BuildContext context) {
    const TextStyle textStyle = TextStyle(color: Colors.white);

    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 154, 123, 239),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 15, // Radius is half of the diameter (30 / 2)
                backgroundColor: Colors.deepPurple, // Circle background color
                child: Text(
                  index.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize:
                        16, // Adjust font size to fit well within the circle
                  ),
                ),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 15,
                child: Text(
                  question,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: textStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                radius: 15,
                child: Icon(Icons.person),
              ),
              const Spacer(flex: 1),
              Expanded(
                flex: 15,
                child: Text(
                  response,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: textStyle,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                  radius: 15,
                  backgroundColor: Color.fromARGB(255, 82, 211, 87),
                  foregroundColor: Colors.white,
                  child: Icon(Icons.check)),
              const Spacer(flex: 1),
              Expanded(
                flex: 15,
                child: Text(
                  correct,
                  textAlign: TextAlign.left,
                  softWrap: true,
                  style: textStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
