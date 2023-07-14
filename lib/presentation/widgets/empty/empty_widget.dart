import 'package:flutter/material.dart';

class EmptyWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final Widget? widget;

  const EmptyWidget({Key? key, required this.constraints, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: constraints.maxWidth,
      height: constraints.maxHeight,
      child: Center(
        child: widget ?? const Text("Empty"),
      ),
    );
  }
}
