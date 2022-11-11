import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
    'assets/images/6.jpg',
    'assets/images/7.jpg',
    'assets/images/8.jpg',
    'assets/images/9.jpg',
    'assets/images/10.jpg',
    'assets/images/11.jpg',
    'assets/images/12.jpg',
    'assets/images/13.jpg',
    'assets/images/14.jpg',
    'assets/images/15.jpg',
    'assets/images/16.jpg',
  ];

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 100),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 50),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.black, Colors.black.withOpacity(0)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/logo-white.png',
            width: 200,
          ),
        ),
      ),
    );
  }

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      backgroundColor: Colors.black,
      body: StaggeredGridView.countBuilder(
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 4,
        itemCount: images.length,
        itemBuilder: (context, index) {
          return Hero(
            tag: images[index],
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(images[index]), fit: BoxFit.cover)),
            ),
          );
        },
        staggeredTileBuilder: (index) {
          return StaggeredTile.count(2, index.isEven ? 3 : 2);
        },
      ),
    );
  }
}
