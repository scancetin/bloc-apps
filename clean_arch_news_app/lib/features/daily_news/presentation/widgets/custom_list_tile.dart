import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final int index;
  const CustomListTile({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(index.toString()),
    );
  }
}
