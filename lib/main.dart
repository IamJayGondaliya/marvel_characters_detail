import 'package:flutter/material.dart';
import 'package:rev_e_com_tanvi/utils/route_utils.dart';
import 'package:rev_e_com_tanvi/views/screens/detail_page.dart';
import 'package:rev_e_com_tanvi/views/screens/favourite_page.dart';
import 'package:rev_e_com_tanvi/views/screens/home_page.dart';

//App initialization
void main() {
  //App execution
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
      ),
      // home: HomePage(),
      // initialRoute: 'home_page',
      routes: {
        MyRoutes.homePage: (context) => const HomePage(), //initialRoute
        MyRoutes.detailPage: (context) => const DetailPage(),
        MyRoutes.favouritePage: (context) => const FavouritePage(),
      },
    );
  }
}
