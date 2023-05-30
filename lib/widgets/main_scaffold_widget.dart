import 'package:flutter/material.dart';

import 'widgets.dart';

class MainScaffoldWidget extends StatelessWidget {
  const MainScaffoldWidget({
    super.key,
    this.child,
    this.floatingActionButton,
    required this.screenTitle,
  });

  final Widget? child;
  final String screenTitle;
  final Widget? floatingActionButton;

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      key: scaffoldKey,
      drawer: const MainMenuWidget(),
      appBar: AppBar(
        title: Text(screenTitle),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SizedBox(
        height: size.height,
        width: size.width,
        child: child,
      )),
      floatingActionButton: floatingActionButton,
    );
  }
}
