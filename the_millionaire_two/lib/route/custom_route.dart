import 'package:flutter/cupertino.dart';

import 'package:who_win_the_million/pages/finish_page.dart';
import 'package:who_win_the_million/pages/home_page.dart';
import 'package:who_win_the_million/pages/play_Page.dart';

class CustomRoutes {
  static Map<String, WidgetBuilder> routes = {
    //*
    ExNavigator.id: (context) => ExNavigator(),
    PlayPage.id: (context) => PlayPage(),
    FinishPage.id: (context) => FinishPage(),
  };
}
