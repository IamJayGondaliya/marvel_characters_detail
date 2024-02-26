import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rev_e_com_tanvi/utils/marvel_characters_utils.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourite Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              width: size.width,
            ),
            ...favCharacters
                .map(
                  (e) => Stack(
                    children: [
                      Row(
                        children: [
                          const Spacer(),
                          Container(
                            height: size.height * 0.2,
                            width: size.width * 0.7,
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: e['color'],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 5,
                                  color: Colors.grey.shade400,
                                  offset: const Offset(5, 5),
                                ),
                              ],
                            ),
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e['name'],
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                IconButton(
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
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height * 0.2,
                        child: Align(
                          alignment: const Alignment(-1, 1),
                          child: Image.asset(
                            e['image'],
                            height: size.height * 0.18,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList()
          ],
        ),
      ),
    );
  }
}
