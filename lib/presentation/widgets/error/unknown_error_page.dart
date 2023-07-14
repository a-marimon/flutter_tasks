import 'package:flutter/material.dart';
import 'package:my_tasks/presentation/widgets/error/central_data.dart';

class UnknownErrorWidget extends StatelessWidget {
  final String detail;
  final Exception exception;
  final StackTrace stackTrace;
  final Function()? callBack;

  const UnknownErrorWidget({Key? key, required this.detail, required this.exception, required this.stackTrace, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        return centralData(
          constraints: constraints,
          scheme: scheme,
          message: "Unknown Exception",
          detail: detail,
          callBack: callBack,
          stackTrace: stackTrace,
        );
      },
    );
  }
}
