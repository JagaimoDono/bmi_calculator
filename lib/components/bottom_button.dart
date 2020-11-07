import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.buttonTitle, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.fromLTRB(kLeftRightMargin, 10, kLeftRightMargin, 10),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: kBottomBarColor,
          borderRadius: BorderRadius.circular(kBorderRadius),
        ),
      ),
    );
  }
}
