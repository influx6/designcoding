import 'package:dev4designers/models/course.dart';
import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

class CourseSectionScreens extends StatelessWidget {
  final Course course;
  final List<Course> courseSections;

  CourseSectionScreens({@required this.course, @required this.courseSections});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: kCardPopupBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(34),
                bottomLeft: Radius.circular(34),
              ),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 32,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text("Course Sections", style: kTitle2Style),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "12 Sections",
                  style: kSubtitleStyle,
                ),
              ],
            ),
          ),
          CourseSectionList(
            course: this.course,
            courseSections: this.courseSections,
          ),
          SizedBox(height: 32),
        ],
      ),
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(34),
        ),
      ),
    );
  }
}

class CourseSectionList extends StatelessWidget {
  final Course course;
  final List<Course> courseSections;

  CourseSectionList({@required this.course, @required this.courseSections});

  List<Widget> courseSectionWidgets() {
    List<Widget> cards = [];
    for (var section in courseSections) {
      cards.add(
        Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: CourseSectionCard(course: section)),
      );
    }

    cards.add(
      Padding(
        padding: EdgeInsets.only(top: 12),
        child: Text(
          "No more Sections to view, look\n for more in our courses",
          style: kCaptionLabelStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: courseSectionWidgets(),
      ),
    );
  }
}

class CourseSectionCard extends StatelessWidget {
  final Course course;

  CourseSectionCard({@required this.course});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          height: 120,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(41),
              child: Padding(
                padding: EdgeInsets.only(left: 32),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'asset/illustrations/${course.illustration}',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                course.courseSubtitle,
                                style: kCardSubtitleStyle,
                              ),
                              SizedBox(height: 6),
                              Text(
                                course.courseTitle,
                                style: kCardTitleStyle,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          decoration: BoxDecoration(
            gradient: course.background,
            borderRadius: BorderRadius.circular(41),
            boxShadow: [
              BoxShadow(
                color: course.background.colors[0].withOpacity(0.3),
                offset: Offset(0, 20),
                blurRadius: 30,
              ),
              BoxShadow(
                color: course.background.colors[1].withOpacity(0.3),
                offset: Offset(0, 20),
                blurRadius: 30,
              ),
            ],
          ),
        ));
  }
}
