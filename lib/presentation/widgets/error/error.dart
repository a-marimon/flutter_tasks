import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/presentation/blocs/dash/dash_bloc.dart';
import 'package:my_tasks/presentation/widgets/error/error.dart';

export './unknown_error_page.dart';
export './error_page.dart';

buildErrorState(BuildContext context, DashErrorState state,{bool small=false}) => MyExceptionErrorWidget(
      exception: state.exception,
      detail: 'PieChart',
      small: small,
      callBack: () {
        context.read<DashBloc>().add(DashRefreshEvent());
      },
    );

buildUnknownErrorState(BuildContext context, DashUnknownErrorState state,{bool small=false}) => UnknownErrorWidget(
      exception: state.exception,
      stackTrace: state.stackTrace,
      detail: 'PieChart',
  small: small,
      callBack: () {
        context.read<DashBloc>().add(DashRefreshEvent());
      },
    );
