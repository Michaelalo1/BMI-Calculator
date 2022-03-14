import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.onTap, @required this.bottomTitle});
  final Function onTap;
  final String bottomTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            bottomTitle,
            style: kBottomTextStyle,
          ),
        ),
        padding: EdgeInsets.only(bottom: 18.0),
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColor,
      ),
    );
  }
}
