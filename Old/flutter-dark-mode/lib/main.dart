import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  bool isDark = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.addListener(() {
      if (_animationController.value > 0.3) {
        setState(() {
          isDark = false;
        });
      } else {
        setState(() {
          isDark = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  //////////////////////////////
  /// @withflutter
  /// Dark mode with lamp :)
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        width: double.infinity,
        color: isDark ? Colors.black87 : Colors.cyan.shade900,
        child: Center(
          child: Transform.scale(
            scale: 2.5,
            child: GestureDetector(
              onTap: () {
                if (isDark) {
                  _animationController.forward();
                } else {
                  _animationController.reverse();
                }
              },
              child: Lottie.asset('assets/lamp.json',
                  controller: _animationController, onLoaded: (composition) {
                _animationController.duration = composition.duration;
              }),
            ),
          ),
        ),
      ),
    );
  }
}
