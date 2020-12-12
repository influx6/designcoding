import 'package:dev4designers/shared/constants.dart';
import 'package:flutter/material.dart';

class SideBarButton extends StatelessWidget {
  SideBarButton({this.onPressed});
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      constraints: BoxConstraints(
        maxWidth: 40.0,
        maxHeight: 40.0,
      ),
      onPressed: this.onPressed,
      child: Container(
          child: Image.asset("asset/icons/icon-sidebar.png",
              color: kPrimaryLabelColor),
          padding: EdgeInsets.symmetric(
            horizontal: 12.0,
            vertical: 12.0,
          ),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: kShadowColor,
                  offset: Offset(0, 12),
                  blurRadius: 16.0,
                )
              ])),
    );
  }
}
