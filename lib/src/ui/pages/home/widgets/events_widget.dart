import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_tasks/main.dart';
import 'package:my_tasks/src/data/device/device_detail.dart';

class EventsWidget extends StatefulWidget {
  const EventsWidget({super.key});

  @override
  State<EventsWidget> createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  Future<List<Map<String, dynamic>>> getEvents() async {
    DeviceDetails deviceDetails = DeviceDetails();
    await deviceDetails.getDeviceDetails();
    final response = await supabase
        .from('eventos')
        .select('''
    nombre_contador, created_at, valor, accion
  ''')
        .eq('device_id', deviceDetails.deviceId)
        .order('id', ascending: false)
        .execute()
        .onError((error, stackTrace) => throw error!);
    print(response.data.runtimeType.toString());
    List<dynamic> dynamicList = response.data;
    List<Map<String, dynamic>> mapList =
        dynamicList.map((item) => item as Map<String, dynamic>).toList();
    print(mapList.runtimeType.toString());
    return mapList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: getEvents(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final events = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              String dateTimeString = event['created_at'];
              DateTime dateTime = DateTime.parse(dateTimeString);
              String formattedDateTime =
                  DateFormat('dd/MM/yyyy HH:mm').format(dateTime);
              return Card(
                child: ListTile(
                  leading: Text(event['nombre_contador']),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(formattedDateTime),
                    ],
                  ),
                  title: Text(event['accion'],
                      textAlign: TextAlign.center),
                  subtitle:
                      Text('${event['valor']}', textAlign: TextAlign.center),
                ),
              );
            },
          );
        } else if (snapshot.hasError) {
          return Expanded(child: Center(child: Text('${snapshot.error}')));
        } else {
          return const Expanded(
              child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
