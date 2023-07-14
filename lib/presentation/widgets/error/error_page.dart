import 'package:flutter/material.dart';
import 'package:my_tasks/data/repository/exepctions.dart';
import 'package:my_tasks/presentation/widgets/error/central_data.dart';

class MyExceptionErrorWidget extends StatelessWidget {
  final String detail;
  final MyException exception;
  final Function()? callBack;

  const MyExceptionErrorWidget({Key? key, required this.detail, required this.exception, this.callBack}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return LayoutBuilder(
      builder: (context, constraints) {
        return centralData(
          constraints: constraints,
          scheme: scheme,
          message: exception.message,
          detail: detail,
          callBack: callBack,
        );
      },
    );
  }
}
