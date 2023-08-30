import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Box extends Equatable {
  final String name;
  final int value;
  final Color color;

  const Box({
    required this.name,
    required this.value,
    required this.color,
  });

  @override
  List<Object?> get props => [name, value, color];

  static List<Box> boxes = [
    const Box(name: "first", value: 1, color: Colors.blue),
    const Box(name: "second", value: 2, color: Colors.purple),
    const Box(name: "third", value: 3, color: Colors.green),
  ];
}
