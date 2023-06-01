import 'package:flutter/material.dart';

class NavigationSection extends StatelessWidget {
  const NavigationSection(
      {super.key, required this.title, required this.text, required this.onPressed});

  final String title;
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title),
        ElevatedButton(
          onPressed: onPressed,
          child: Text(text),
        ),
      ],
    );
  }
}
