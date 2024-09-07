import 'package:flutter/material.dart';
import 'package:dice/grad_container.dart';
import 'package:dice/dice.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GradientContainer(
          DiceController(),
          palette: [Colors.deepPurple, Colors.purple, Colors.purpleAccent],
        ),
      ),
    ),
  );
}
