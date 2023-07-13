import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_tasks/presentation/widgets/drawer.dart';
import 'package:my_tasks/presentation/widgets/oepration_count.dart';
import 'package:my_tasks/presentation/widgets/operations_list.dart';
import 'package:my_tasks/presentation/widgets/pie_chart.dart';
import 'package:my_tasks/data/const.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_tasks/data/dash/dash_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<DashBloc>().add(DashRefreshEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(kAppName),
      ),
      drawer: const MyDrawer(),
      drawerEdgeDragWidth: size.width / 5,
      body: Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: StaggeredGrid.count(
          crossAxisCount: size.width > size.height ? 8 : 4,
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
          axisDirection: AxisDirection.down,
          children: [
            StaggeredGridTile.count(
              crossAxisCellCount: size.width > size.height ? 4 : 2,
              mainAxisCellCount: size.width > size.height ? 4 : 2,
              child: const Card(child: PieChartWidget()),
            ),
            StaggeredGridTile.count(
              crossAxisCellCount: size.width > size.height ? 4 : 2,
              mainAxisCellCount:  size.width > size.height ? 1 : 2,
              child: const OperationCount(),
            ),
            const StaggeredGridTile.count(
              crossAxisCellCount: 4,
              mainAxisCellCount: 6,
              child: OperationList(),
            ),
          ],
        ),
      ),
    );
  }
}
