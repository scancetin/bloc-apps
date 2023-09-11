import 'package:flutter/material.dart';

class PageViewDotsWidget extends StatelessWidget {
  const PageViewDotsWidget({super.key, required this.isCurrent});
  final bool isCurrent;
  static const double dotWidth = 8;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: dotWidth * 0.25),
      width: dotWidth,
      height: isCurrent ? dotWidth * 3 : dotWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(dotWidth * 0.5),
        color: isCurrent ? Colors.deepPurpleAccent : Colors.grey,
      ),
    );
  }
}
