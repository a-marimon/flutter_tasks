import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/presentation/blocs/counter/counter_bloc.dart';
import 'package:my_tasks/presentation/pages/counter/real_page.dart';

class CounterPage extends StatelessWidget {
  static String pageName = 'CounterPage';

  const CounterPage({Key? key, required this.counterName}) : super(key: key);

  final String counterName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(create: (_) => CounterBloc(name: counterName), child: RealCounterPage(name: counterName));
  }
}
