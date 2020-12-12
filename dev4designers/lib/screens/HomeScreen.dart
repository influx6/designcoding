import 'package:dev4designers/components/ExploreCourses.dart';
import 'package:dev4designers/components/Headers.dart';
import 'package:dev4designers/components/NavBar.dart';
import 'package:dev4designers/components/recentCourseList.dart';
import 'package:dev4designers/models/course.dart';
import 'package:dev4designers/models/sidebar.dart';
import 'package:dev4designers/screens/continueWatchingScreen.dart';
import 'package:dev4designers/screens/sidebarScreen.dart';
import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    @required this.courses,
    @required this.sideBarItems,
    @required this.continueWatchingCourses,
    @required this.courseSections,
  });

  final List<SidebarItem> sideBarItems;
  final List<Course> courseSections;
  final List<Course> continueWatchingCourses;
  final List<Course> courses;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  Animation<Offset> sideBarAnimation;
  AnimationController sideBarAnimationController;

  Animation<double> fadeAnimation;

  bool ignoreSideBar = true;

  @override
  void initState() {
    super.initState();

    sideBarAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );

    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: sideBarAnimationController,
      curve: Curves.easeInOut,
    ));

    sideBarAnimation = Tween<Offset>(
      begin: Offset(-1, 0),
      end: Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: sideBarAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sideBarAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    HomeScreenNavBar(
                      onSideBarButtonPress: () {
                        sideBarAnimationController.forward();
                        setState(() {
                          ignoreSideBar = false;
                        });
                      },
                    ),
                    RecentCourseHeader(),
                    SizedBox(height: 20),
                    RecentCourseList(
                      courses: widget.courses.getRange(0, 2).toList(),
                      courseSections: widget.courseSections,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 25,
                        bottom: 16,
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [Text("Explore", style: kTitle1Style)]),
                    ),
                    ExploreCourses(
                      courses: widget.courses
                          .getRange(0, widget.courses.length)
                          .cast<Course>()
                          .toList(growable: false),
                    ),
                  ],
                ),
              ),
            ),
            ContinueWatchingScreen(courses: widget.continueWatchingCourses),
            IgnorePointer(
              ignoring: ignoreSideBar,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: GestureDetector(
                      child: Container(
                        color: Color.fromRGBO(36, 38, 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                      onTap: () {
                        sideBarAnimationController.reverse();
                        setState(() {
                          ignoreSideBar = true;
                        });
                      },
                    ),
                  ),
                  SlideTransition(
                    position: sideBarAnimation,
                    child: SafeArea(
                        bottom: false,
                        child:
                            SidebarScreen(sideBarItems: widget.sideBarItems)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
