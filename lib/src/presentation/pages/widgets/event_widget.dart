import 'package:flutter/material.dart';
import 'package:my_tasks/src/core/theme/theme_context.dart';
import 'package:my_tasks/src/core/util/utils.dart';

import '../../../domain/models/event_model.dart';

class EventWidget extends StatelessWidget {
  const EventWidget({super.key, required this.event});

  final EventModel event;

  @override
  Widget build(BuildContext context) {
    final date = Utils.formatDate(event.time!);
    final time = Utils.formatTime(event.time!);

    return Card(
      child: ListTile(
        leading: Text(
          event.name!.toUpperCase(),
          style: context.theme.textTheme.titleLarge,
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(date),
            Text(time),
          ],
        ),
        title: Text('Evento: ${event.action!}'),
        subtitle: Text('${event.value!}'),
      ),
    );
  }
}
