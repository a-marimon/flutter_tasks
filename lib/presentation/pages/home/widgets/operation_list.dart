import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/domain/entity/counter/counter_entity.dart';
import 'package:my_tasks/presentation/blocs/dash/dash_bloc.dart';
import 'package:my_tasks/presentation/widgets/error/error.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:timeago/timeago.dart' as timeago;

class OperationList extends StatefulWidget {
  const OperationList({Key? key}) : super(key: key);

  @override
  State<OperationList> createState() => _OperationListState();
}

class _OperationListState extends State<OperationList> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: nameCounters.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          indicatorSize: TabBarIndicatorSize.tab,
          tabs: nameCounters.map((e) => Tab(text: e['name'])).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: nameCounters
                .map(
                  (e) => BlocBuilder<DashBloc, DashState>(
                    builder: (ctx, state) {
                      switch (state.runtimeType) {
                        case DashInitialState:
                          return _buildLoadingState();

                        case DashReadyState:
                          return _buildReadyState(state as DashReadyState, _tabController.index, scheme: scheme, counterColor: e['color']);

                        case DashErrorState:
                          return buildErrorState(context, state as DashErrorState);

                        case DashUnknownErrorState:
                          return buildUnknownErrorState(context, state as DashUnknownErrorState);

                        default:
                          return _buildLoadingState();
                      }
                    },
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  _buildLoadingState() => Skeletonizer(
        enabled: true,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          itemBuilder: (context, index) {
            return const ListTile(
              leading: CircleAvatar(),
              title: Text("Operation DateTime"),
              subtitle: Text("Opertion TimeAgo"),
              trailing: Text("0"),
            );
          },
        ),
      );

  _buildReadyState(DashReadyState state, int tabIndex, {required ColorScheme scheme, required Color counterColor}) {
    List<CounterEntity> list = state.list[tabIndex].operations;

    return state.list.isEmpty
        ? const Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: kDefaultPadding),
              child: Text("Empty"),
            ),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (_, i) => ListTile(
              leading: CircleAvatar(
                backgroundColor: counterColor,
                child: Text(list[i].operation, style: TextStyle(fontSize: 24, color: scheme.background)),
              ),
              title: Text(DateFormat(dateFormat).format(list[i].datetime.toLocal())),
              subtitle: Text(timeago.format(list[i].datetime)),
              trailing: Text(
                list[i].current.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            itemCount: list.length,
          );
  }
}
