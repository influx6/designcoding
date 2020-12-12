import 'package:dev4designers/components/recentCourseCard.dart';
import 'package:dev4designers/models/course.dart';
import 'package:dev4designers/screens/CourseScreen.dart';
import 'package:flutter/material.dart';

class RecentCourseList extends StatefulWidget {
  RecentCourseList({@required this.courses, @required this.courseSections});

  final List<Course> courses;
  final List<Course> courseSections;

  @override
  _RecentCourseListState createState() => _RecentCourseListState();
}

class _RecentCourseListState extends State<RecentCourseList> {
  int currentPage = 0;
  List<Container> indicators = [];

  Widget updateIndicators() {
    List<Widget> items = widget.courses
        .map(
          (Course course) {
            var index = widget.courses.indexOf(course);
            return Container(
              width: 7,
              height: 7,
              margin: EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentPage == index
                    ? Color(0xFF0971FE)
                    : Color(0xFFA6AEBD),
              ),
            );
          },
        )
        .cast<Widget>()
        .toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: items,
    );
  }

  void onPageChange(int newPage) {
    setState(() {
      this.currentPage = newPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RecentCourses(
          courses: widget.courses,
          page: this.currentPage,
          onPageChange: onPageChange,
          courseSections: widget.courseSections,
        ),
        updateIndicators(),
      ],
    );
  }
}

class RecentCourses extends StatelessWidget {
  RecentCourses({
    @required this.courses,
    @required this.page,
    @required this.onPageChange,
    @required this.courseSections,
  });

  final Function(int) onPageChange;
  final int page;
  final List<Course> courses;
  final List<Course> courseSections;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 320,
        width: double.infinity,
        child: PageView.builder(
          itemCount: this.courses.length,
          onPageChanged: onPageChange,
          controller:
              PageController(initialPage: this.page, viewportFraction: 0.65),
          itemBuilder: (context, index) {
            Course data = this.courses[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CourseScreen(
                      course: data,
                      courseSections: this.courseSections,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
              child: Opacity(
                opacity: index == this.page ? 1.0 : 0.5,
                child:
                    RecentCourseCard(course: data, key: Key(index.toString())),
              ),
            );
          },
        ));
  }
}
