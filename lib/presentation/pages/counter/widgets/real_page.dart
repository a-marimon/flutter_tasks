import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/presentation/blocs/counter/counter_bloc.dart';
import 'package:my_tasks/presentation/widgets/error/error.dart';

class RealCounterPage extends StatefulWidget {
  final String name;

  const RealCounterPage({Key? key, required this.name}) : super(key: key);

  @override
  State<RealCounterPage> createState() => _RealCounterPageState();
}

class _RealCounterPageState extends State<RealCounterPage> {
  @override
  void initState() {
    context.read<CounterBloc>().add(const CounterLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(builder: (ctx, state) {
        switch (state.runtimeType) {
          case CounterInitialState:
            return _buildLoadingState();
          case CounterReadyState:
            return _buildReadyState(state as CounterReadyState);
          case CounterErrorState:
            return buildErrorState(context, (state as CounterErrorState).exception, small: true);

          case CounterUnknownErrorState:
            return buildUnknownErrorState(context, (state as CounterUnknownErrorState).exception, state.stackTrace, small: true);
          default:
            return _buildLoadingState();
        }
      }),
    );
  }

  _buildLoadingState() => SizedBox();

  _buildReadyState(CounterReadyState state) {
    return SizedBox();
  }
}
