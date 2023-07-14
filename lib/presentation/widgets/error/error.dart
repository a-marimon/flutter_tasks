import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/data/repository/exepctions.dart';
import 'package:my_tasks/presentation/blocs/dash/dash_bloc.dart';
import 'package:my_tasks/presentation/widgets/error/error.dart';

export './unknown_error_widget.dart';
export './error_widget.dart';

buildErrorState(BuildContext context, MyException exception, {bool small = false}) => MyExceptionErrorWidget(
      exception: exception,
      detail: 'PieChart',
      small: small,
      callBack: () {
        context.read<DashBloc>().add(DashRefreshEvent());
      },
    );

buildUnknownErrorState(BuildContext context, Exception exception, StackTrace stackTrace, {bool small = false}) => UnknownErrorWidget(
      exception: exception,
      stackTrace: stackTrace,
      detail: 'PieChart',
      small: small,
      callBack: () {
        context.read<DashBloc>().add(DashRefreshEvent());
      },
    );
