import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/main.dart';
import 'package:my_tasks/src/ui/bloc/counter/counter_bloc.dart';

class CountTwoPage extends StatefulWidget {
  const CountTwoPage({super.key});

  @override
  State<CountTwoPage> createState() => _CountTwoPageState();
}

class _CountTwoPageState extends State<CountTwoPage> {
  @override
  Widget build(BuildContext context) {
    final CounterBloc counterBloc2 = CounterBloc('Contador B', 0);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => GoRouter.of(context).go('/'),
        ),
        title: const Text('Contador B'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              onPressed: () async {
                if(!await counterBloc2.decrementCounter()){
                  ScaffoldMessenger.of(context).showSnackBar(snackbar);
                }
              },
              child: const Icon(Icons.remove),
            ),
            StreamBuilder<CounterData>(
                stream: counterBloc2.counterStream,
                initialData: CounterData('Contador B', 0),
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
                if(!await counterBloc2.incrementCounter()){
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
