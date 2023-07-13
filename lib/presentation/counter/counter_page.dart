import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/data/counter/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  static String pageName = 'CounterPage';

  const CounterPage({Key? key, required this.counterName}) : super(key: key);

  final String counterName;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (_) => _createCounterBloc(counterName),
      child: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) => _Counter(state: state, name: counterName),
      ),
    );
  }

  CounterBloc _createCounterBloc(String counterName) {
    return CounterBloc(name: counterName);
  }
}

class _Counter extends StatefulWidget {
  final CounterState state;
  final String name;

  const _Counter({Key? key, required this.state, required this.name}) : super(key: key);

  @override
  State<_Counter> createState() => __CounterState();
}

class __CounterState extends State<_Counter> {
  @override
  void initState() {
    context.read<CounterBloc>().add(const CounterLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final color = nameCounters.firstWhere((element) => element['name'] == widget.name)['color'];
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Builder(builder: (_) {
        if (widget.state is CounterReadyState) {
          return Center(
            child: CircleAvatar(
              radius: size.width * 0.2,
              backgroundColor: color,
              child: Text(
                '${(widget.state as CounterReadyState).entity.current}',
                style: TextStyle(fontSize: size.width * 0.2),
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator(strokeWidth: 2));
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: widget.state is CounterReadyState
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FloatingActionButton.small(
                  heroTag: 'decrement',
                  onPressed: (widget.state as CounterReadyState).request ? null : () => BlocProvider.of<CounterBloc>(context).add(const CounterDelEvent()),
                  tooltip: 'Decrement',
                  backgroundColor: color,
                  child: (widget.state as CounterReadyState).request
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.remove),
                ),
                const SizedBox(width: kDefaultPadding / 2),
                FloatingActionButton.small(
                  heroTag: 'increment',
                  onPressed: (widget.state as CounterReadyState).request ? null : () => BlocProvider.of<CounterBloc>(context).add(const CounterAddEvent()),
                  tooltip: 'Increment',
                  backgroundColor: color,
                  child: (widget.state as CounterReadyState).request
                      ? const SizedBox(
                          width: 24,
                          height: 24,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.add),
                ),
              ],
            )
          : null,
    );
  }
}
