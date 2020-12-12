import 'package:dev4designers/components/CourseDetails.dart';
import 'package:dev4designers/models/course.dart';
import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  final Course course;
  final List<Course> courseSections;

  CourseScreen({@required this.course, @required this.courseSections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: CourseDetail(
          course: this.course,
          courseSections: this.courseSections,
        ),
      ),
    );
  }
}
