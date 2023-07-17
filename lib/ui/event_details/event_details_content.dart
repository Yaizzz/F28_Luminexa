import 'package:bootcamp_app1/models/event_repository.dart';
import 'package:bootcamp_app1/styleguide.dart';
import 'package:flutter/material.dart';

class EventDetailsContent extends StatelessWidget {
  final Event event;

  const EventDetailsContent({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 110,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: Text(
              event.title,
              style: eventWhiteTitleTextStyle,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.2),
            child: FittedBox(
              child: Row(
                children: <Widget>[
                  Text(
                    "-",
                    style: eventLocationTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Icon(Icons.location_on, color: Colors.white,),
                  SizedBox( width: 5,),
                  Text(
                    event.location,
                    style: eventLocationTextStyle.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 120,),
          Padding(
              padding: const EdgeInsets.all(16),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: sample_event.punchLine1, style: punchLine1TextStyle,),
                    TextSpan(text: sample_event.punchLine2, style: punchLine2TextStyle,),
                  ]
                ),
              ),
          ),
          if (event.description.isNotEmpty) Padding(
            padding: const EdgeInsets.all(16),
            child: Text(event.description, style: eventLocationTextStyle,),
          ),
          if (event.galleryImages.isNotEmpty) Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 16),
            child: Text(
              "GALLERY",
              style: guestTextStyle,
            ),
          ),
          if (event.galleryImages.isNotEmpty) SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                for (final galleryImagePath in event.galleryImages)
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.asset(
                        galleryImagePath,
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
              ],
            ),
          ),


        ],
      ),
    );
  }
}
