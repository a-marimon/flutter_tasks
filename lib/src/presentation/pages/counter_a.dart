import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/injection_container.dart';
import 'package:my_tasks/src/presentation/pages/widgets/floating_actions.dart';

import '../../core/theme/theme_context.dart';
import '../bloc/counter_a/counter_a_cubit.dart';

class CounterA extends StatelessWidget {
  const CounterA({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CounterACubit>()..getValue(),
      child: const CounterAView(),
    );
  }
}

class CounterAView extends StatelessWidget {
  const CounterAView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador A'),
      ),
      floatingActionButton: FloatingActions(
        onIncrement: () {
          context.read<CounterACubit>().increment();
        },
        onDecrement: () {
          context.read<CounterACubit>().decrement();
        },
      ),
      body: Center(
        child: BlocBuilder<CounterACubit, CounterAState>(
          builder: (context, state) {
            if (state is CounterALoading) {
              return const CircularProgressIndicator();
            }
            return Text(
              '${state.value}',
              style: context.theme.textTheme.displayMedium,
            );
          },
        ),
      ),
    );
  }
}
