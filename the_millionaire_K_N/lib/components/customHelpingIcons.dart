import 'package:flutter/material.dart';

Padding customHelpingIcons({Function onPressed, String iconName}) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
    child: RaisedButton(
      color: Colors.transparent,
      onPressed: onPressed,
      child: Image.asset(
        'assets/images/$iconName.png',
        width: 90,
        height: 90,
      ),
    ),
  );
}
