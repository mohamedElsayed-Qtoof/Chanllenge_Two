import 'package:flutter/material.dart';

// ------------------------------------
// * Custom AppBar
// ------------------------------------

class MainAppBar extends StatelessWidget {
  String barTitle;

  MainAppBar({this.barTitle});

  @override
  Widget build(BuildContext context) {
    return mainAppbar(barTitle);
  }

  static AppBar mainAppbar(String mytitle) {
    return AppBar(
      title: Text(mytitle),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}
