import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/injection_container.dart';
import 'package:my_tasks/src/core/theme/theme_context.dart';
import 'package:my_tasks/src/presentation/pages/widgets/floating_actions.dart';

import '../bloc/counter_b/counter_b_cubit.dart';

class CounterB extends StatelessWidget {
  const CounterB({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CounterBCubit>()..getValue(),
      child: const CounterBView(),
    );
  }
}

class CounterBView extends StatelessWidget {
  const CounterBView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador B'),
      ),
      floatingActionButton: FloatingActions(
        onIncrement: () {
          context.read<CounterBCubit>().increment();
        },
        onDecrement: () {
          context.read<CounterBCubit>().decrement();
        },
      ),
      body: Center(
        child: BlocBuilder<CounterBCubit, CounterBState>(
          builder: (context, state) {
            if (state is CounterBLoading) {
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
