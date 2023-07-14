import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/presentation/blocs/dash/dash_bloc.dart';

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
                  (e) => BlocBuilder<DashBloc, DashState>(builder: (ctx, state) {
                    return SizedBox();
                  }),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
