import 'package:flutter/material.dart';

import '../constants.dart';

class ReusableCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({@required this.cardColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(kLeftRightMargin),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
        child: cardChild,
      ),
    );
  }
}
