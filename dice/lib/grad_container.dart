import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer(this.widget, {super.key, required this.palette});

  static const redGradient = [Colors.red, Colors.orange, Colors.yellowAccent];
  const GradientContainer.red(this.widget, {super.key, this.palette= redGradient}) ;

  final Widget widget;
  final List<Color> palette;

  @override
  Widget build(context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: palette,
        ),
      ),
      child: Center(
        child: widget,
      ),
    );
  }
}



