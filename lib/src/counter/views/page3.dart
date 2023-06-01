import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/src/counter/bloc/counter_bloc.dart';
import 'package:my_tasks/src/counter/data/counter_dto.dart';
import 'package:my_tasks/src/utils/utils.dart';

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  void initState() {
    context.read<CounterBloc>().add(ListCounterA());
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
              return Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      color: Colors.red,
                    ),
                    const SizedBox.square(dimension: 5),
                    Expanded(
                      child: ListView.builder(
                          itemCount: state.listCountersA!.length,
                          itemBuilder: (context, index) {
                            CounterDto counter = state.listCountersA![index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 1,
                                          spreadRadius: 1),
                                    ],
                                    borderRadius: BorderRadius.circular(5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text('A'),
                                      Column(
                                        children: [
                                          Text(Utils.getDateFromTimestamp(
                                              counter.createdAt.toString())),
                                          const SizedBox.square(dimension: 1),
                                          Text(Utils.getTimeFromTimestamp(
                                              counter.createdAt.toString())),
                                        ],
                                      ),
                                      Text(counter.operation!),
                                      Text(counter.value.toString()),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              );
          }
        },
      ),
    );
  }
}
