import 'package:flutter/material.dart';

class Course {
  Course({
    this.courseTitle,
    this.courseSubtitle,
    this.background,
    this.illustration,
    this.logo,
  });

  String courseTitle;
  String courseSubtitle;
  LinearGradient background;
  String illustration;
  String logo;
}

