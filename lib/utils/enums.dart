import 'package:flutter/material.dart';

enum ColorSeed {
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  red('Red', Colors.red),
  yellow('Yellow', Colors.yellow),
  cyan('Cyan', Color.fromARGB(255, 0, 128, 119)),
  green('Green', Colors.green),
  teal('Teal', Colors.teal),
  orange('Orange', Colors.orange),
  brown('Brown', Colors.brown),
  pink('Pink', Colors.pink);

  const ColorSeed(
    this.label,
    this.color,
  );
  final String label;
  final Color color;
}
