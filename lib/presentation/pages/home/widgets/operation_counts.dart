import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/data/const.dart';

import 'package:my_tasks/presentation/blocs/dash/dash_bloc.dart';
import 'package:my_tasks/presentation/widgets/error/error.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OperationCount extends StatelessWidget {
  const OperationCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DashBloc, DashState>(builder: (ctx, state) {
      switch (state.runtimeType) {
        case DashInitialState:
          return _buildLoadingState();

        case DashReadyState:
          return _buildReadyState(state as DashReadyState);

        case DashErrorState:
          return buildErrorState(context, (state as DashErrorState).exception, small: true, detail: "OperationCount", callBack: () {
            ctx.read<DashBloc>().add(DashRefreshEvent());
          });

        case DashUnknownErrorState:
          return buildUnknownErrorState(context, (state as DashUnknownErrorState).exception, state.stackTrace, small: true, detail: "OperationCount", callBack: () {
            ctx.read<DashBloc>().add(DashRefreshEvent());
          });

        default:
          return _buildLoadingState();
      }
    });
  }

  //muestra una estructura esqueletal de los widgets que posea dentro
  _buildLoadingState() => Skeletonizer(
        enabled: true,
        child: ListView.builder(
          itemCount: nameCounters.length,
          itemBuilder: (context, index) {
            return const Card(
              child: ListTile(
                title: Text("Counter Name"),
                subtitle: Text("Operations"),
              ),
            );
          },
        ),
      );

  _buildReadyState(DashReadyState state) {
    return SingleChildScrollView(
      child: Column(
        children: nameCounters.map(
          (e) {
            return Card(
              child: ListTile(
                title: Text(e['name']),
                subtitle: Text("Operations: ${state.operationCounts(e['name'])}"),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
