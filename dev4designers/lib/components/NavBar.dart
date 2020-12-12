import 'package:dev4designers/components/SearchBar.dart';
import 'package:dev4designers/screens/ProfileScreen.dart';
import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

import 'SideBarButton.dart';

class HomeScreenNavBar extends StatelessWidget {
  HomeScreenNavBar({this.onSideBarButtonPress, this.onSearchBarText});

  Function onSideBarButtonPress;
  Function(String) onSearchBarText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SideBarButton(onPressed: this.onSideBarButtonPress),
          SearchBar(onSearch: this.onSearchBarText),
          Icon(
            Icons.notifications,
            color: kPrimaryLabelColor,
          ),
          SizedBox(
            width: 16,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (ctx) {
                    return ProfileScreen();
                  },
                ),
              );
            },
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('asset/images/profile.jpg'),
            ),
          )
        ],
      ),
    );
  }
}
