import 'package:flutter/material.dart';

class LargeCustomText extends StatelessWidget {
  final double size;
  final String text;
  final Color color;
  const LargeCustomText({
    super.key,
    this.size = 30,
    required this.text,
    this.color = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
