import 'package:dev4designers/components/certificates.dart';
import 'package:dev4designers/models/course.dart';
import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ContinueWatchingScreen extends StatelessWidget {
  ContinueWatchingScreen({this.courses});

  final List<Course> courses;

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      backdropEnabled: true,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(34),
      ),
      color: kCardPopupBackgroundColor,
      boxShadow: [
        BoxShadow(color: kShadowColor, offset: Offset(0, -12), blurRadius: 32)
      ],
      minHeight: 85,
      maxHeight: MediaQuery.of(context).size.height * 0.75,
      panel: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: 12, bottom: 16),
              child: Container(
                width: 42,
                height: 4.0,
                decoration: BoxDecoration(
                  color: Color(0xFFc5CBD6),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Continue Watching",
              style: kTitle2Style,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 22),
            child: ContinueWatchingList(courses: this.courses),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              "Certificates",
              style: kTitle2Style,
            ),
          ),
          Expanded(
            child: Center(child: CertificateExplorer()),
          ),
        ],
      ),
    );
  }
}

class ContinueWatchingList extends StatefulWidget {
  ContinueWatchingList({this.courses});

  final List<Course> courses;

  @override
  _ContinueWatchingListState createState() => _ContinueWatchingListState();
}

class _ContinueWatchingListState extends State<ContinueWatchingList> {
  List<Container> indicators;
  int currentPage = 0;

  Widget updateIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.courses
          .map((Course course) {
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
          })
          .cast<Widget>()
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: PageView.builder(
            controller: PageController(
              initialPage: 0,
              viewportFraction: 0.75,
            ),
            onPageChanged: (int index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: widget.courses.length,
            itemBuilder: (context, index) {
              return ContinueWatchingCard(
                  course: widget.courses[index], active: currentPage == index);
            },
          ),
        ),
        this.updateIndicators(),
      ],
    );
  }
}

class ContinueWatchingCard extends StatelessWidget {
  ContinueWatchingCard({@required this.course, @required this.active, Key key})
      : super(key: key);

  final Course course;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: this.active ? 1.0 : 0.5,
      child: Container(
        alignment: Alignment.topCenter,
        child: Stack(alignment: Alignment.topRight, children: [
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              right: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: this.course.background,
                borderRadius: BorderRadius.circular(41.0),
                boxShadow: [
                  BoxShadow(
                      color: course.background.colors[0].withOpacity(0.3),
                      offset: Offset(0, 20),
                      blurRadius: 20),
                  BoxShadow(
                      color: course.background.colors[1].withOpacity(0.3),
                      offset: Offset(0, 20),
                      blurRadius: 20),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(41),
                child: Container(
                  height: 140,
                  width: 260,
                  child: Stack(
                    children: [
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Image.asset(
                                "asset/illustrations/${this.course.illustration}",
                                fit: BoxFit.cover,
                                height: 110,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(course.courseSubtitle,
                                style: kCardSubtitleStyle),
                            SizedBox(height: 6),
                            Text(course.courseTitle, style: kCardTitleStyle),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            child: Image.asset("asset/icons/icon-play.png"),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 4),
                  blurRadius: 16,
                )
              ],
            ),
            padding: EdgeInsets.only(
              top: 12.5,
              bottom: 13.5,
              left: 20.5,
              right: 14.5,
            ),
          ),
        ]),
      ),
    );
  }
}
