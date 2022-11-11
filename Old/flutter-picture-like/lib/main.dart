import 'package:flutter/material.dart';
import 'package:insta_like_button/insta_like_button.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return InstaLikeButton(
              image: AssetImage('assets/images/${index + 1}.jpg'),
              imageBoxfit: BoxFit.cover,
              iconColor: Colors.red,
              onChanged: () {});
        },
      ),
    );
  }
}
