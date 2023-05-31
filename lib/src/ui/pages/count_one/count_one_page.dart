import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/main.dart';
import 'package:my_tasks/src/ui/bloc/counter/counter_bloc.dart';

class CountOnePage extends StatefulWidget {
  const CountOnePage({super.key});

  @override
  State<CountOnePage> createState() => _CountOnePageState();
}

class _CountOnePageState extends State<CountOnePage> {

  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc1 = CounterBloc('Contador A', 0);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).go('/'),
        ),
        title: const Text('Contador A'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                if(!await counterBloc1.decrementCounter()){
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              child: const Icon(Icons.remove),
            ),
            StreamBuilder<CounterData>(
                stream: counterBloc1.counterStream,
                initialData: CounterData('Contador A', 0),
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data!.counterValue}',
                    style: const TextStyle(
                      fontSize: 18.0,
                    ),
                  );
                }),
            ElevatedButton(
              onPressed: () async {
                if(!await counterBloc1.incrementCounter()){
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}


