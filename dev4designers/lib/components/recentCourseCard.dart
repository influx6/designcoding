import 'package:dev4designers/models/course.dart';
import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RecentCourseCard extends StatelessWidget {
  RecentCourseCard({@required this.course, Key key}) : super(key: key);

  final Course course;

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.topRight, children: [
      Padding(
        padding: EdgeInsets.only(top: 20),
        child: Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
              gradient: this.course.background,
              borderRadius: BorderRadius.circular(41.0),
              boxShadow: [
                BoxShadow(
                    color: course.background.colors[0].withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 30),
                BoxShadow(
                    color: course.background.colors[1].withOpacity(0.3),
                    offset: Offset(0, 20),
                    blurRadius: 30),
              ]),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 32, left: 32, right: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                      tag: course.courseSubtitle,
                      child: Text(
                        course.courseSubtitle,
                        style: kCardSubtitleStyle,
                      ),
                    ),
                    SizedBox(height: 6),
                    Hero(
                      tag: course.courseTitle,
                      child: Text(
                        course.courseTitle,
                        style: kCardTitleStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Hero(
                  tag: course.illustration,
                  child: Image.asset(
                      "asset/illustrations/${this.course.illustration}",
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
        ),
      ),
      this.course.logo != null
          ? Padding(
              padding: EdgeInsets.only(right: 42),
              child: Container(
                child: Hero(
                  tag: course.logo,
                  child: Image.asset("asset/logos/${this.course.logo}"),
                ),
                width: 60,
                height: 60,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                        color: kShadowColor,
                        offset: Offset(0, 4),
                        blurRadius: 16)
                  ],
                ),
              ),
            )
          : Container()
    ]);
  }
}
