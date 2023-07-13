import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_tasks/presentation/counter/counter_page.dart';
import 'package:my_tasks/presentation/settings/settings_page.dart';
import 'package:my_tasks/data/const.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: SizedBox(
        height: size.height,
        child: Column(
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/icon.png'))),
              child: SizedBox(width: double.maxFinite),
            ),
            Expanded(
              child: ListView(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: nameCounters
                      .map(
                        (e) => ListTile(
                          leading: Icon(
                            Icons.exposure,
                            color: e['color'] as Color,
                          ),
                          title: Text("Counter ${e['name']}"),
                          onTap: () {
                            Navigator.pop(context);
                            context.go(context.namedLocation(CounterPage.pageName, pathParameters: {"name": e['name']}));
                          },
                        ),
                      )
                      .toList()),
            ),
            const Divider(height: 1),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                context.go(context.namedLocation(SettingsPage.pageName));
              },
            ),
          ],
        ),
      ),
    );
  }
}
