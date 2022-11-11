import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";

const String _url = 'https://github.com/afifudinn';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

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
        appBar: AppBar(
          backgroundColor: Colors.orange,
          centerTitle: true,
          title: Text('URL Launcher',
              style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
        ),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _launchURL();
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.grey.shade900,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FeatherIcons.github,
                      color: Colors.white,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Text(
                      'GitHub',
                      style: GoogleFonts.inter(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
