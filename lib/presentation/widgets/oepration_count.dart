import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/data/dash/dash_bloc.dart';

class OperationCount extends StatelessWidget {
  const OperationCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dashBloc = context.watch<DashBloc>();
    return SingleChildScrollView(
      child: Column(
        children: nameCounters.map(
          (e) {
            int index = dashBloc.state is DashReadyState ? (dashBloc.state as DashReadyState).list.indexWhere((element) => element.name == e['name']) : -1;
            int operationCounts = 0;
            if (index != -1) {
              operationCounts = (dashBloc.state as DashReadyState).list[index].count;
            }

            return Card(
              child: ListTile(
                title: Text(e['name']),
                subtitle: Text("Operations: $operationCounts"),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
