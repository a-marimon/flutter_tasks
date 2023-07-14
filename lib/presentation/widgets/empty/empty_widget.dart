import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final BoxConstraints constraints;

  const EmptyWidget({Key? key, required this.constraints}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
      child: const Center(
        child: Text("Empty"),
      ),
    );
  }
}
