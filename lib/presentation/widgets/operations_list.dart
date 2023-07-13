import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/data/dash/dash_bloc.dart';
import 'package:my_tasks/domain/entity/counter/counter_entity.dart';
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
    final blocDash = context.watch<DashBloc>();
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
            children: nameCounters.map(
              (e) {
                int index = blocDash.state is DashReadyState ? (blocDash.state as DashReadyState).list.indexWhere((element) => element.name == e['name']) : -1;
                List<CounterEntity> list = [];
                if (index != -1) {
                  list = (blocDash.state as DashReadyState).list[index].operations;
                }
                return list.isEmpty
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
                            backgroundColor: e['color'],
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
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
