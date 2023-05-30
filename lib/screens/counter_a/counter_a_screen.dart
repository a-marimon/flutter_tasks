import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';
import 'cubit/counter_a_cubit.dart';

class CounterAScreen extends StatelessWidget {
  const CounterAScreen({super.key});

  static String routeName = 'CounterAScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterACubit(),
      child: const _CounterView(),
    );
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    return MainScaffoldWidget(
      screenTitle: 'Contador A',
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'increment',
            onPressed: () => context.read<CounterACubit>().increment(),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            heroTag: 'decrement',
            onPressed: () => context.read<CounterACubit>().decrement(),
            child: const Icon(Icons.remove),
          ),
        ],
      ),
      child: const Center(child: _CounterText()),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterACubit cubit) => cubit.state);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$count', style: theme.textTheme.displayLarge),
      ],
    );
  }
}
