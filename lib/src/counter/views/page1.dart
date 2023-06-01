import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/src/counter/bloc/counter_bloc.dart';
import 'package:my_tasks/src/counter/widgets/counter_section.dart';
import 'package:my_tasks/src/counter/widgets/navigation_section.dart';
import 'package:my_tasks/src/routes/app_router.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  void initState() {
    context.read<CounterBloc>().add(InitData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CounterBloc, CounterState>(
        builder: (context, state) {
          switch (state.counterStatus) {
            case CounterStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case CounterStatus.error:
              return const Center(
                child: Text('Ha ocurrido un error inesperado'),
              );
            default:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox.square(dimension: 100),
                  //* Navigation Section
                  NavigationSection(
                    title: 'Contador A',
                    text: 'Ir al contador B',
                    onPressed: () {
                      context.pushNamed(AppRouter.page2.name);
                    },
                  ),

                  const SizedBox.square(dimension: 10),

                  //*Counter Section
                  CounterSection(
                    value: state.currentCounterA!.value!,
                    onPressedAdd: () {
                      context.read<CounterBloc>().add(CounterAddA());
                    },
                    onPressedDecrement: () {
                      context.read<CounterBloc>().add(CounterDecrementA());
                    },
                  ),
                  const SizedBox.square(dimension: 10),

                  ElevatedButton(
                      onPressed: () {
                        context.pushNamed(AppRouter.page3.name);
                      },
                      child: const Text('Ver estadísticas')),
                ],
              );
          }
        },
      ),
    );
  }
}
