import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;

  ReusableIcon({this.icon, this.label, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: kIconSize,
          color: iconColor,
        ),
        SizedBox(
          height: sizedBoxHeight,
        ),
        Text(
          label.toUpperCase(),
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
