import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/app_cubits_cubit.dart';

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
    return GestureDetector(
      onTap: BlocProvider.of<AppCubits>(context).getData,
      child: Container(
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
      ),
    );
  }
}
