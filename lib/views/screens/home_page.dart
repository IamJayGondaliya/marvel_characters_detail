import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rev_e_com_tanvi/utils/marvel_characters_utils.dart';
import 'package:rev_e_com_tanvi/utils/route_utils.dart';
//  Routing
//  class         - Navigator
//  next page     - push
//  previous page - pop         (BACK)
//  Types:
/*
      1. Default routes
      2. Named routes
      3. OnGenerate routes

      1. Default routes:

          //1st route
          MaterialApp(
            home: const FirstPage(),
          ),

          // Next page:
          - Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NextPage(),
              ),
            );

          // Previous page: (Back)
          - Navigator.of(context).pop();

       2. Named routes:

       //1st route:
       MaterialApp(
          initialRoute: "first_page",
          routes: {
            'first_route': (context) => const FirstPage(),
            'second_route': (context) => const SecondPage(),
          },
       ),
              -----------------OR-------------------
       MaterialApp(
          routes: {
            '/': (context) => const FirstPage(),
            'second_route': (context) => const SecondPage(),
          },
       ),

       // Next page:
       - Navigator.of(context).pushNamed('route_name');



*/

// class MyRoute extends MaterialPageRoute {
//   MyRoute(WidgetBuilder builder) : super(builder: builder);
//
//   @override
//   Duration get transitionDuration => const Duration(
//         seconds: 1,
//       );
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //MediaQuery
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).pushNamed(
                MyRoutes.favouritePage,
              );
              setState(() {});
            },
            icon: const Icon(
              Icons.star,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: allCharacters
                  .map(
                    (e) => GestureDetector(
                      onTap: () async {
                        await Navigator.of(context).pushNamed(
                          MyRoutes.detailPage,
                          arguments: e,
                        );
                        setState(() {
                          log("HP refreshed...");
                        });

                        // Navigator.of(context).push(
                        //   // SlowTransitionRoute(
                        //   //   builder: (context) => DetailPage(),
                        //   // ),
                        //   // MaterialPageRoute(
                        //   //   builder: (context) => DetailPage(
                        //   //     data: e,
                        //   //   ),
                        //   // ),
                        //   // MyRoute(
                        //   //   (context) => DetailPage(
                        //   //     data: e,
                        //   //   ),
                        //   // ),
                        // );
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          //0
                          Container(
                            height: size.height * 0.5,
                            width: size.width * 0.7,
                            margin: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: e['color'],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade400,
                                  blurRadius: 10,
                                  offset: const Offset(10, 10),
                                ),
                              ],
                            ),
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    e['name'],
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: IconButton(
                                    onPressed: () {
                                      if (favCharacters.contains(e)) {
                                        favCharacters.remove(e);
                                      } else {
                                        favCharacters.add(e);
                                      }
                                      setState(() {});
                                    },
                                    icon: Icon(
                                      favCharacters.contains(e)
                                          ? Icons.star
                                          : Icons.star_border,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //1
                          Align(
                            alignment: const Alignment(0, -0.7),
                            child: Hero(
                              // flightShuttleBuilder:
                              //     (context, _, __, context2, context3) =>
                              //         const Center(
                              //             child: CircularProgressIndicator()),
                              tag: e['name'],
                              child: Image.asset(
                                e['image'],
                                height: size.height * 0.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
