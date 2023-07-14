import 'package:flutter/material.dart';
import 'package:my_tasks/data/const.dart';
import 'package:my_tasks/presentation/pages/home/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(kAppName),
      ),
      drawer: const MyDrawer(),
      drawerEdgeDragWidth: size.width / 4, //Defino el area donde aceptara el gesto para abrir el drawer
    );
  }
}
