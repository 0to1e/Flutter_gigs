import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.widget});
  
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Color.fromARGB(255, 139, 95, 213)],
        ),
      ),
      child: widget);
  }
}
