import 'package:flutter/material.dart';

class MainMenuWidget extends StatelessWidget {
  const MainMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.zero,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: [
                ListTile(
                  title: const Text('Contador A'),
                  onTap: () {},
                ),
                const Divider(),
                ListTile(
                  title: const Text('Contador B'),
                  onTap: () {},
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
