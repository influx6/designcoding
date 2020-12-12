import 'package:dev4designers/components/sidebarRow.dart';
import 'package:dev4designers/models/sidebar.dart';
import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

class SidebarScreen extends StatelessWidget {
  SidebarScreen({this.sideBarItems});
  final List<SidebarItem> sideBarItems;

  @override
  Widget build(BuildContext context) {
    var rows = [
      ...sideBarItems
          .map((item) => Column(
                children: [
                  SidebarRow(item: item),
                  SizedBox(
                    height: 32,
                  )
                ],
              ))
          .toList(),
      Spacer(),
      Row(
        children: [
          Image.asset("asset/icons/icon-logout.png", width: 17.0),
          SizedBox(width: 12),
          Text("Log out", style: kSecondaryCalloutLabelStyle),
        ],
      )
    ];
    return SidebarMenuScreen(rows: rows);
  }
}

class SidebarMenuScreen extends StatelessWidget {
  const SidebarMenuScreen({@required this.rows});
  final List<Widget> rows;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSidebarBackgroundColor,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(34.0),
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.85,
      padding: EdgeInsets.symmetric(
        vertical: 35,
        horizontal: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("asset/images/profile.jpg"),
                radius: 21.0,
              ),
              SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Alex", style: kHeadlineLabelStyle),
                  SizedBox(
                    height: 4,
                  ),
                  Text("License ends 21st Jan, 2021",
                      style: kSearchPlaceholderStyle),
                ],
              ),
            ],
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          ...this.rows,
        ],
      ),
    );
  }
}
