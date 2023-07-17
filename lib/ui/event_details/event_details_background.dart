

import 'package:bootcamp_app1/models/event_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class EventDetailsBackground extends ConsumerWidget {
  final Event event;
  const EventDetailsBackground({Key? key, required this.event}) : super(key: key);



  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;


    return Align(
      alignment: Alignment.topCenter,
      child: ClipPath(
        clipper: EventClipper(),
        child: Image.asset(
          event.imagePath,
          fit: BoxFit.cover,
          color: Color(0x99000000),
          colorBlendMode: BlendMode.darken,
          width: screenWidth,
          height: screenHeight * 0.40,
        ),
      ),
    );
  }
}

class EventClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    final double middleHeight = size.height * 0.75;
    Path path = Path();

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
  
}



