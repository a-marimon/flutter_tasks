import 'package:flutter/material.dart';

class CounterSection extends StatelessWidget {
  const CounterSection({
    super.key,
    required this.onPressedAdd,
    required this.onPressedDecrement,
    required this.value,
  });

  final int value;
  final Function() onPressedAdd;
  final Function() onPressedDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value.toString()),
        const SizedBox.square(dimension: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: onPressedAdd,
              child: const Text('Sumar 1'),
            ),
            const SizedBox.square(dimension: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
              onPressed: onPressedDecrement,
              child: const Text('Restar 1'),
            ),
          ],
        ),
      ],
    );
  }
}
