import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/device/utils.dart';
import 'package:my_tasks/presentation/blocs/counter/counter_bloc.dart';
import 'package:my_tasks/presentation/widgets/error/error.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RealCounterPage extends StatefulWidget {
  final String name;

  const RealCounterPage({Key? key, required this.name}) : super(key: key);

  @override
  State<RealCounterPage> createState() => _RealCounterPageState();
}

class _RealCounterPageState extends State<RealCounterPage> {
  @override
  void initState() {
    context.read<CounterBloc>().add(const CounterLoadEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double radiusToCircleAvatar = size.width > size.height ? size.height * 0.2 : size.width * 0.2;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: BlocBuilder<CounterBloc, CounterState>(builder: (ctx, state) {
        switch (state.runtimeType) {
          case CounterInitialState:
            return _buildLoadingState(radius: radiusToCircleAvatar);
          case CounterReadyState:
            return _buildReadyState(state as CounterReadyState, nameCounters.firstWhere((element) => element['name'] == widget.name), radius: radiusToCircleAvatar);
          case CounterErrorState:
            return buildErrorState(
              context,
              (state as CounterErrorState).exception,
              detail: "CounterPage",
              callBack: () => ctx.read<CounterBloc>().add(const CounterReLoadEvent()),
            );

          case CounterUnknownErrorState:
            return buildUnknownErrorState(
              context,
              (state as CounterUnknownErrorState).exception,
              state.stackTrace,
              detail: "CounterPage",
              callBack: () => ctx.read<CounterBloc>().add(const CounterReLoadEvent()),
            );
          default:
            return _buildLoadingState(radius: radiusToCircleAvatar);
        }
      }),
    );
  }

  //muestra una estructura esqueletal de los widgets que posea dentro
  _buildLoadingState({required double radius}) => Skeletonizer(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: double.maxFinite),
            CircleAvatar(radius: radius),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton.small(onPressed: () {}, heroTag: 'increment'),
                  const SizedBox(width: kDefaultPadding),
                  FloatingActionButton.small(onPressed: () {}, heroTag: 'decrement'),
                ],
              ),
            )
          ],
        ),
      );

  _buildReadyState(CounterReadyState state, Map<String, dynamic> counter, {required double radius}) {
    final scheme = Theme.of(context).colorScheme;
    Widget loading = SizedBox(
      width: 24,
      height: 24,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation(scheme.background),
      ),
    );
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const SizedBox(width: double.maxFinite),
        CircleAvatar(
          radius: radius,
          backgroundColor: Utils.getCounterColor(counter['name']),
          child: Text(
            state.entity.current.toString(),
            style: TextStyle(fontSize: radius, color: scheme.background),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton.small(
                onPressed: state.request ? null : () => context.read<CounterBloc>().add(const CounterDelEvent()),
                heroTag: 'decrement',
                backgroundColor: Utils.getCounterColor(counter['name']),
                child: state.request ? loading : Icon(Icons.remove, color: scheme.background),
              ),
              const SizedBox(width: kDefaultPadding),
              FloatingActionButton.small(
                onPressed: state.request ? null : () => context.read<CounterBloc>().add(const CounterAddEvent()),
                heroTag: 'increment',
                backgroundColor: Utils.getCounterColor(counter['name']),
                child: state.request ? loading : Icon(Icons.add, color: scheme.background),
              ),
            ],
          ),
        )
      ],
    );
  }
}
