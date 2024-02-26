import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  // final Map<String, dynamic> data;

  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    //Named route
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); //BACK
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(data['name']),
      ),
      body: Center(
        child: Column(
          children: [
            Hero(
              // flightShuttleBuilder: (context, _, __, context2, context3) =>
              //     const Center(
              //   child: CircularProgressIndicator(),
              // ),
              tag: data['name'],
              child: Image.asset(
                data['image'],
                height: size.height * 0.6,
              ),
            ),
            Transform.scale(
              scaleX: 8,
              child: CircularProgressIndicator(
                value: 1,
                color: data['color'],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
