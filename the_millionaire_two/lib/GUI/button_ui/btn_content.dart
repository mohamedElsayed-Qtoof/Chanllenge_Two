import 'package:flutter/material.dart';

class BtnContent extends StatelessWidget {
  @required
  final String moneyVal;
  @required
  final String btnIndex;
  @required
  final Color btnColor;
  final width;
  final height;

  @required
  final Color txtColour;
  final Function customOnPressed;

  // *  [ Constructor ]
  BtnContent(
      {this.moneyVal,
      this.btnIndex,
      this.btnColor,
      this.width,
      this.height,
      this.txtColour,
      this.customOnPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: btnColor,
      textColor: txtColour,
      onPressed: customOnPressed(),
      child: Text(moneyVal),
    );
  }
}
