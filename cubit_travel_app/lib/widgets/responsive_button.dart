import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double width;
  final String text;

  const ResponsiveButton({
    super.key,
    this.text = "",
    this.isResponsive = false,
    this.width = 80,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.blueAccent),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text),
          const Icon(Icons.arrow_right_alt_rounded, size: 40),
        ],
      ),
    );
  }
}
