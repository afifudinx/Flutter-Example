import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController.addListener(() {
      setState(() {});
    });
    Future.delayed(const Duration(seconds: 1), () {
      _animationController.forward().orCancel;
    });
    Future.delayed(const Duration(seconds: 7), () {
      Navigator.pushNamed(context, '/');
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Lottie.asset('assets/lottie/nike-loading.json',
              controller: _animationController, onLoaded: (composition) {
        _animationController.duration = composition.duration;
      })),
    );
  }
}
