import 'package:flutter/material.dart';
import 'package:who_win_the_million/constants/dimen/custom_dimen.dart';

// ------------------------------------
// * Design Cards to Auto Draw
// ------------------------------------

class CustomCardDesign extends StatelessWidget {
  final Color colour;
  final Widget cardWidget;
  final Function onPressed;
  final double height;
  final double width;
  final EdgeInsetsGeometry myPadding;

  CustomCardDesign({
    @required this.colour,
    @required this.cardWidget,
    this.onPressed,
    this.height,
    this.width,
    this.myPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardWidget,
      height: height,
      width: width,
      padding: myPadding,
      //color: colour,
      margin: EdgeInsets.all(CustomDimen.kyVal2),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(CustomDimen.kyVal5),
      ),
    );
  }
}
