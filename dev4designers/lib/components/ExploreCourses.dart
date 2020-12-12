import 'package:dev4designers/models/course.dart';
import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

class ExploreCourses extends StatelessWidget {
  ExploreCourses({this.courses});
  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: this.courses.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(left: index == 0 ? 20 : 0),
            child: ExploreCourseCard(course: this.courses[index]),
          );
        },
      ),
    );
  }
}

class ExploreCourseCard extends StatelessWidget {
  final Course course;
  ExploreCourseCard({@required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(41),
        child: Container(
          height: 120,
          width: 280,
          decoration: BoxDecoration(
            gradient: course.background,
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 32),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(course.courseSubtitle, style: kCardSubtitleStyle),
                      SizedBox(height: 6),
                      Text(course.courseTitle, style: kCardTitleStyle),
                    ],
                  )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset('asset/illustrations/${course.illustration}',
                          fit: BoxFit.cover, height: 100),
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
