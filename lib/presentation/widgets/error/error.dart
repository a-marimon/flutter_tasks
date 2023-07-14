import 'package:flutter/material.dart';
import 'package:my_tasks/data/repository/exepctions.dart';
import 'package:my_tasks/presentation/widgets/error/error.dart';

export './unknown_error_widget.dart';
export './error_widget.dart';

buildErrorState(BuildContext context, MyException exception, {bool small = false, Function()? callBack, String? detail}) => MyExceptionErrorWidget(
      exception: exception,
      detail: detail ?? "No detail",
      small: small,
      callBack: callBack,
    );

buildUnknownErrorState(BuildContext context, Exception exception, StackTrace stackTrace, {bool small = false, Function()? callBack, String? detail}) => UnknownErrorWidget(
      exception: exception,
      stackTrace: stackTrace,
      detail: detail ?? "No detail",
      small: small,
      callBack: callBack,
    );
