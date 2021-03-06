import 'package:dev4designers/models/course.dart';
import 'package:dev4designers/models/sidebar.dart';
import 'package:dev4designers/screens/HomeScreen.dart';
import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

var sidebarItems = [
  SidebarItem(
    title: "Home",
    icon: Icon(HomeIcon, color: Colors.white),
    background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF00AEFF),
          Color(0xFF0076FF),
        ]),
  ),
  SidebarItem(
    title: "Courses",
    icon: Icon(LibraryIcon, color: Colors.white),
    background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFA7d75),
          Color(0xFFC23D61),
        ]),
  ),
  SidebarItem(
    title: "Billing",
    icon: Icon(BillingIcon, color: Colors.white),
    background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFFFAD64A),
          Color(0xFFEA880F),
        ]),
  ),
  SidebarItem(
    title: "Settings",
    icon: Icon(SettingsIcon, color: Colors.white),
    background: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF4E62CC),
          Color(0xFF202A78),
        ]),
  ),
];

// Recent Courses
var recentCourses = [
  Course(
    courseTitle: "Flutter for Designers",
    courseSubtitle: "12 sections",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    illustration: 'illustration-01.png',
    logo: 'flutter-logo.png',
  ),
  Course(
    courseTitle: "Prototyping with ProtoPie",
    courseSubtitle: "10 sections",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFD504F),
        Color(0xFFFF8181),
      ],
    ),
    illustration: 'illustration-02.png',
    logo: 'protopie-logo.png',
  ),
  Course(
    courseTitle: "Build an app with SwiftUI",
    courseSubtitle: "22 sections",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00E1EE),
        Color(0xFF001392),
      ],
    ),
    illustration: 'illustration-03.png',
    logo: 'swift-logo.png',
  ),
];

// Explore Courses
var exploreCourses = [
  Course(
    courseTitle: "Build an app with SwiftUI",
    courseSubtitle: "22 sections",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF5BCEA6),
        Color(0xFF1997AB),
      ],
    ),
    illustration: 'illustration-04.png',
    logo: 'swift-logo.png',
  ),
  Course(
    courseTitle: "Build an app with SwiftUI",
    courseSubtitle: "22 sections",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFA931E5),
        Color(0xFF4B02FE),
      ],
    ),
    illustration: 'illustration-05.png',
    logo: 'swift-logo.png',
  ),
];

// Continue Watching Courses
var continueWatchingCourses = [
  Course(
    courseTitle: "React for Designers",
    courseSubtitle: "SVG Animations",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF4E62CC),
        Color(0xFF202A78),
      ],
    ),
    illustration: 'illustration-06.png',
    logo: 'flutter-logo.png',
  ),
  Course(
    courseTitle: "Animating in Principle",
    courseSubtitle: "Multiple Scrolling",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFA7D75),
        Color(0xFFC23D61),
      ],
    ),
    illustration: 'illustration-07.png',
  ),
];

// Course Sections
var courseSections = [
  Course(
    courseTitle: "Flutter for Designers",
    courseSubtitle: "02 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    illustration: 'illustration-01.png',
    logo: 'flutter-logo.png',
  ),
  Course(
    courseTitle: "Build an app with SwiftUI",
    courseSubtitle: "01 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFE477AE),
        Color(0xFFC54284),
      ],
    ),
    illustration: 'illustration-08.png',
    logo: 'swift-logo.png',
  ),
  Course(
    courseTitle: "ProtoPie Prototyping",
    courseSubtitle: "03 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFEA7E58),
        Color(0xFFCE4E27),
      ],
    ),
    illustration: 'illustration-09.png',
  ),
  Course(
    courseTitle: "UI Design Course",
    courseSubtitle: "04 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF72CFD4),
        Color(0xFF42A0C2),
      ],
    ),
    illustration: 'illustration-10.png',
  ),
  Course(
    courseTitle: "React for Designers",
    courseSubtitle: "05 Section",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFF2E56),
        Color(0xFFCB012B),
      ],
    ),
    illustration: 'illustration-11.png',
  ),
];

// Completed Courses
var completedCourses = [
  Course(
    courseTitle: "Build an ARKit 2 App",
    courseSubtitle: "Certified",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFFF6B94),
        Color(0xFF6B2E98),
      ],
    ),
    illustration: 'illustration-12.png',
    logo: 'swift-logo.png',
  ),
  Course(
    courseTitle: "Swift Advanced",
    courseSubtitle: "Yet to be Certified",
    background: LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFFDEC8FA),
        Color(0xFF4A1B6D),
      ],
    ),
    illustration: 'illustration-13.png',
    logo: 'swift-logo.png',
  ),
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(
        courses: recentCourses,
        courseSections: courseSections,
        sideBarItems: sidebarItems,
        continueWatchingCourses: continueWatchingCourses,
      ),
    );
  }
}
