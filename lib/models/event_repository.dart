import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Event{
  final String imagePath, title, description, location, duration , punchLine1, punchLine2;
  final List categoryIds, galleryImages;

  Event(
    {required this.imagePath,
    required this.title,
    required this.description,
    required this.location,
    required this.duration,
    required this.punchLine1,
    required this.punchLine2,
    required this.categoryIds,
    required this.galleryImages});
}

Event sample_event = Event(
    imagePath: 'assets/event_images/pexels-wolfgang-2747449.jpg',
    title: "sample_title",
    description: "sample_description",
    location: "sample_location",
    duration: "sample_duration",
    punchLine1: "sample_punchLine1",
    punchLine2: "sample_punchLine2",
    categoryIds: [0,1],
    galleryImages: [],
);

Event sample_event1 = Event(
  imagePath: 'assets/event_images/pexels-wolfgang-2747449.jpg',
  title: "sample_title",
  description: "sample_description",
  location: "sample_location",
  duration: "sample_duration",
  punchLine1: "sample_punchLine1",
  punchLine2: "sample_punchLine2",
  categoryIds: [0,1],
  galleryImages: [],
);

Event sample_event2 = Event(
  imagePath: 'assets/event_images/pexels-wolfgang-2747449.jpg',
  title: "sample_title",
  description: "sample_description",
  location: "sample_location",
  duration: "sample_duration",
  punchLine1: "sample_punchLine1",
  punchLine2: "sample_punchLine2",
  categoryIds: [0,1],
  galleryImages: [],
);

Event sample_event3 = Event(
  imagePath: 'assets/event_images/pexels-wolfgang-2747449.jpg',
  title: "sample_title",
  description: "sample_description",
  location: "sample_location",
  duration: "sample_duration",
  punchLine1: "sample_punchLine1",
  punchLine2: "sample_punchLine2",
  categoryIds: [0,1],
  galleryImages: [],
);

final events = [
  sample_event,
  sample_event1,
  sample_event2,
  sample_event3,
];


