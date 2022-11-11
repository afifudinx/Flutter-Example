import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

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
  double progress = 0;
  bool isComplete = false;

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title:
              const Text('Illustration', style: TextStyle(color: Colors.black)),
        ),
        body: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: const DecorationImage(
                          image: AssetImage('assets/image.png'),
                          fit: BoxFit.cover)),
                ),
                const SizedBox(
                  height: 30,
                ),
                LinearPercentIndicator(
                  percent: progress,
                  animation: true,
                  animationDuration: 4000,
                  curve: Curves.slowMiddle,
                  progressColor: Colors.black,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      progress = 1;
                    });
                    Timer(const Duration(seconds: 4), () {
                      setState(() {
                        isComplete = true;
                      });
                    });
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Text(isComplete ? 'Completed' : 'Download Now',
                          style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.white70)),
                    ),
                  ),
                ),
              ],
            )));
  }
}
