import 'package:flutter/material.dart';

class SlowTransitionRoute extends MaterialPageRoute {
  SlowTransitionRoute({required super.builder});

  @override
  Duration get transitionDuration => const Duration(seconds: 1);
}

class MyRoutes {
  static String homePage = '/';
  static String detailPage = 'detail_page';
  static String favouritePage = 'favourite_page';
}
