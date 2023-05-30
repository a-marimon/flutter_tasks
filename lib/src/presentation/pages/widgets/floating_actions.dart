import 'package:flutter/material.dart';

class FloatingActions extends StatelessWidget {
  const FloatingActions({super.key, this.onIncrement, this.onDecrement});

  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          key: const Key('increment_floatingActionButton'),
          heroTag: 'increment',
          onPressed: onIncrement,
          child: const Icon(Icons.add),
        ),
        const SizedBox(height: 8),
        FloatingActionButton(
          key: const Key('decrement_floatingActionButton'),
          heroTag: 'decrement',
          onPressed: onDecrement,
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
