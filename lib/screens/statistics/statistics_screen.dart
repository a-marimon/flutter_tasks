import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  static String routeName = 'StatisticsScreen';

  @override
  Widget build(BuildContext context) {
    return MainScaffoldWidget(
      screenTitle: 'Estadísticas',
    );
  }
}
