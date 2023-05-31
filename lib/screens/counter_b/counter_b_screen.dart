import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';
import 'cubit/counter_b_cubit.dart';

class CounterBScreen extends StatelessWidget {
  const CounterBScreen({super.key});

  static String routeName = 'CounterBScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBCubit(),
      child: const _CounterView(),
    );
  }
}

class _CounterView extends StatelessWidget {
  const _CounterView();

  @override
  Widget build(BuildContext context) {
    return MainScaffoldWidget(
        screenTitle: 'Contador B',
        child: Stack(
          children: [
            const Align(
              alignment: Alignment.center,
              child: _CounterText(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          context.read<CounterBCubit>().increment(),
                      child: const Text('Sumar'),
                    ),
                    ElevatedButton(
                      onPressed: () =>
                          context.read<CounterBCubit>().decrement(),
                      child: const Text('Restar'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
        //const Center(child: _CounterText()),
        );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((CounterBCubit cubit) => cubit.state.counter);
    final isLoading =
        context.select((CounterBCubit cubit) => cubit.state.isLoading);
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
