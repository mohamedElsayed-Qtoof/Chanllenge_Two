import 'package:flutter/material.dart';
import 'package:who_win_the_million/components/customr_appbar.dart';
import 'package:who_win_the_million/pages/play_Page.dart';

// ------------------------------------
// * Home Page
// ------------------------------------

class ExNavigator extends StatelessWidget {
  static final id = 'ExNavigator';
  String barTitle = 'مسابقة من سيربح المليون';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar.mainAppbar(barTitle),
      body: PlayPage(),
    );
  }
}
