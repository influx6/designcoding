import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

class RecentCourseHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Recents", style: kLargeTitleStyle),
          SizedBox(
            height: 5,
          ),
          Text(
            "23 Courses, more coming",
            style: kSubtitleStyle,
          )
        ],
      ),
    );
  }
}
