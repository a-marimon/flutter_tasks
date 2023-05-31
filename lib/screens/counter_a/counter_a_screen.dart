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
    final cubit = context.read<CounterACubit>();

    return MainScaffoldWidget(
      screenTitle: 'Contador A',
      floatingActionButton: BlocBuilder<CounterACubit, CounterAState>(
        builder: (_, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FloatingActionButton(
                heroTag: 'increment',
                onPressed: state.isLoading ? null : () => cubit.increment(),
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 8),
              FloatingActionButton(
                heroTag: 'decrement',
                onPressed: () => cubit.decrement(),
                child: const Icon(Icons.remove),
              ),
            ],
          );
        },
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
    final count = context.select((CounterACubit cubit) => cubit.state.counter);
    final isLoading =
        context.select((CounterACubit cubit) => cubit.state.isLoading);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Visibility(
            visible: isLoading,
            child: const CircularProgressIndicator.adaptive()),
        Text('$count', style: theme.textTheme.displayLarge),
      ],
    );
  }
}
