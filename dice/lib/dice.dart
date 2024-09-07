import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceController extends StatefulWidget {
  const DiceController({super.key});

  @override
  State<DiceController> createState() => _DiceControllerState();
}

class _DiceControllerState extends State<DiceController> {
  int currentDice = 2;

  void diceRoller() {
    setState(() {
      currentDice = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset("assets/images/dice-images/dice-$currentDice.png"),
        const SizedBox(height: 20),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              padding:
                  const EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
            ),
            onPressed: diceRoller,
            child: const Text(
              "Roll the dice",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ))
      ],
    );
  }
}
