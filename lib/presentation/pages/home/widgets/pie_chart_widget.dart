import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/data/repository/exepctions.dart';
import 'package:my_tasks/presentation/blocs/dash/dash_bloc.dart';

class PieChartWidget extends StatelessWidget {
  const PieChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, contrain) => BlocBuilder<DashBloc, DashState>(builder: (ctx, state) {
        switch (state.runtimeType) {
          case DashInitialState:
            return _buildLoadingState();

          case DashReadyState:
            return _buildReadyState(state as DashReadyState);

          case DashErrorState:
            return _buildErrorState((state as DashErrorState).exception);

          case DashUnknownErrorState:
            return _buildUnknownErrorState((state as DashUnknownErrorState).exception);

          default:
            return _buildLoadingState();
        }
      }),
    );
  }

  _buildLoadingState() => const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );

  _buildReadyState(DashReadyState state) => SizedBox();

  _buildErrorState(MyException exception) => SizedBox();

  _buildUnknownErrorState(Exception e) => SizedBox();
}
