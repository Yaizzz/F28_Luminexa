import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/event_repository.dart';
import 'event_details_content.dart';
import 'event_details_background.dart';



class EventsDetailPage extends ConsumerWidget {
  const EventsDetailPage({Key? key, required this.event}) : super(key: key);
  final Event event;

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return Scaffold(
      body: Stack(
        children: <Widget>[
          EventDetailsBackground(event: event),
          EventDetailsContent(event: event),

        ],
      ),
    );
  }
}


