import 'package:flutter/material.dart';
import 'package:flutter_empty_state/utils/fade_animation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const MyApp()},
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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeAnimation(
                delay: 200, child: Image.asset('assets/images/1.png')),
            FadeAnimation(
              delay: 400,
              child: Text('Page Not Found',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700, fontSize: 30)),
            ),
            const SizedBox(
              height: 12,
            ),
            FadeAnimation(
              delay: 600,
              child: Text('Something went wrong',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, color: Colors.grey)),
            ),
            const SizedBox(
              height: 64,
            ),
            FadeAnimation(
              delay: 800,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.orange.shade900,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 36, vertical: 16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/', (route) => true);
                  },
                  child: Text('Try Again',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600, color: Colors.white))),
            )
          ],
        ),
      ),
    );
  }
}
