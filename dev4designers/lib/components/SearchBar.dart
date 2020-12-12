import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({this.onSearch});
  Function(String) onSearch;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: EdgeInsets.only(left: 12.0, right: 33.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 12),
                blurRadius: 16,
                color: kShadowColor,
              )
            ]),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(
            cursorColor: kPrimaryLabelColor,
            decoration: InputDecoration(
              icon: Icon(Icons.search, color: kPrimaryLabelColor, size: 20.0),
              border: InputBorder.none,
              hintText: "Search for courses",
              hintStyle: kSearchPlaceholderStyle,
            ),
            onChanged: this.onSearch,
          ),
        ),
      ),
    ));
  }
}
