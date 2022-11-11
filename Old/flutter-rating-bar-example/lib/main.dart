import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_rating_bar_example/utils/fade_animation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {'/': (context) => const MyApp()}));

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
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(24),
          width: double.infinity,
          child: Column(
            children: [
              FadeAnimation(
                  delay: 200,
                  child: Image.asset('assets/images/illustration.png')),
              const SizedBox(
                height: 48,
              ),
              FadeAnimation(
                delay: 400,
                child: Text('Your opinion matters!',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                    )),
              ),
              const SizedBox(
                height: 12,
              ),
              FadeAnimation(
                delay: 600,
                child: Text(
                    'We work super hard to make app\n better for you, and would love to know:\n how would you rate our app?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade700)),
              ),
              const SizedBox(
                height: 48,
              ),
              FadeAnimation(
                delay: 800,
                child: RatingBar.builder(
                  initialRating: 3,
                  glow: false,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (route) => false);
                },
                child: FadeAnimation(
                  delay: 1000,
                  child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                          child: Text('Submit',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)))),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              FadeAnimation(
                delay: 1200,
                child: Text('No Thanks',
                    style: GoogleFonts.inter(
                        color: Colors.grey, fontWeight: FontWeight.w500)),
              )
            ],
          ),
        )));
  }
}
