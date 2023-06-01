import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/counter/bloc/counter_bloc.dart';
import 'package:my_tasks/src/counter/widgets/counter_section.dart';
import 'package:my_tasks/src/counter/widgets/navigation_section.dart';
import 'package:my_tasks/src/routes/app_router.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
        switch (state.counterStatus) {
          case CounterStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case CounterStatus.error:
            return const Center(
              child: Text('Ha ocurrido un error inesperado'),
            );
          default:
            return SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //* Navigation Section
                  NavigationSection(
                    title: 'Contador B',
                    text: 'Ir al contador A',
                    onPressed: () {
                      context.pushNamed(AppRouter.page1.name);
                    },
                  ),

                  //*Counter Section
                  CounterSection(
                      value: state.currentCounterB!.value!,
                      onPressedAdd: () {
                        context.read<CounterBloc>().add(CounterAddB());
                      },
                      onPressedDecrement: () {
                        context.read<CounterBloc>().add(CounterDecrementB());
                      }),
                  const SizedBox.square(dimension: 10),

                  ElevatedButton(
                      onPressed: () {
                        context.pushNamed(AppRouter.page3.name,
                            pathParameters: {'counterValue': 'counterB'});
                      },
                      child: const Text('Ver estadísticas')),
                ],
              ),
            );
        }
      }),
    );
  }
}
