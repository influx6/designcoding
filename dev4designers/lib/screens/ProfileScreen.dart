import 'dart:io';

import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final List<String> badges = [
    'badge-01.png',
    'badge-02.png',
    'badge-03.png',
    'badge-04.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    Padding(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RawMaterialButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.arrow_back,
                                  color: kSecondaryLabelColor,
                                ),
                              ],
                            ),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            constraints: BoxConstraints(
                              minWidth: 40,
                              maxWidth: 40,
                              maxHeight: 24,
                            ),
                          ),
                          Text(
                            "Profile",
                            style: kCalloutLabelStyle,
                          ),
                          Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(14),
                              boxShadow: [
                                BoxShadow(
                                  color: kShadowColor,
                                  offset: Offset(0, 12),
                                  blurRadius: 32,
                                ),
                              ],
                            ),
                            child: Icon(
                              Platform.isAndroid
                                  ? Icons.settings
                                  : CupertinoIcons.settings_solid,
                              color: kSecondaryLabelColor,
                            ),
                          ),
                        ],
                      ),
                      padding: EdgeInsets.only(
                        top: 24,
                        bottom: 32,
                        left: 20,
                        right: 20,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Container(
                                padding: EdgeInsets.all(6),
                                child: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('asset/images/profile.jpg'),
                                  radius: 30,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(42),
                                ),
                              ),
                            ),
                            height: 84,
                            width: 84,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(42),
                              gradient: RadialGradient(
                                colors: [
                                  Color(0xFF00AEFF),
                                  Color(0xFF0076FF),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Alex Ewe", style: kTitle2Style),
                              SizedBox(height: 8),
                              Text(
                                "Developer",
                                style: kSecondaryCalloutLabelStyle,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 28, bottom: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Badges",
                                  style: kHeadlineLabelStyle,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "See all",
                                      style: kSearchPlaceholderStyle,
                                    ),
                                    Icon(
                                      Icons.chevron_right,
                                      color: kSecondaryLabelColor,
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 112,
                      child: ListView.builder(
                        padding: EdgeInsets.only(bottom: 28),
                        scrollDirection: Axis.horizontal,
                        itemCount: badges.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: EdgeInsets.only(
                                right: index != 3 ? 0 : 20, left: 20),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: kShadowColor.withOpacity(0.1),
                                  offset: Offset(0, 12),
                                  blurRadius: 18,
                                ),
                              ],
                            ),
                            child: Image.asset('asset/badges/${badges[index]}'),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                color: kCardPopupBackgroundColor,
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor,
                    offset: Offset(0, 12),
                    blurRadius: 32,
                  ),
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(34),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
