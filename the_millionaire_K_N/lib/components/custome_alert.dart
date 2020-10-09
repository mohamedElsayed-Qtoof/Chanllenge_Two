//the alert
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Alert customAlert({
  String title,
  String desc,
  String text,
  Function onPressed,
  BuildContext context,
}) {
  return Alert(
      context: context,
      title: title,
      desc: desc,
      style: AlertStyle(
        isCloseButton: false,
      ),
      buttons: [
        DialogButton(
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ]);
}
