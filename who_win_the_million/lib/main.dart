import 'package:flutter/material.dart';
import 'package:who_win_the_million/GUI/theme/app_theme.dart';
import 'package:who_win_the_million/pages/intro_page.dart';
import 'package:who_win_the_million/route/custom_route.dart';

// ------------------------------------
// * Main Competition Page
// ------------------------------------
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'مسابقة من سيربح المليون 2020',
      theme: AppTheme.customTheme(),
      home: IntroPage(), //
      //initialRoute: ExNavigator.id,

      routes: CustomRoutes.routes,
    );
  }
}
