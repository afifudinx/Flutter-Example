import 'package:flutter/material.dart';
import 'package:flutter_fadeanimation/utils/fade_animation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> images = [
    'filipp-romanovski.jpg',
    'ivan-bandura.jpg',
    'jason-leung.jpg',
    'john-schaidler.jpg',
    'julia-koi.jpg',
    'kelly-sikkema.jpg',
    'marcin-kempa.jpg',
    'mohammad-rahmani.jpg',
    'moritz-knoringer.jpg',
    'pawel-czerwinski.jpg',
    'standsome-worklifestyle.jpg',
    'viva-luna-studios.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffF8F8F8),
        elevation: 1,
        centerTitle: true,
        title: Text('Gallery',
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 16)),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.all(24),
              child: Column(
                  children: images.map((image) {
                return FadeAnimation(
                  delay: 300 * (images.indexOf(image) + 1),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset('assets/images/$image'),
                    ),
                  ),
                );
              }).toList()),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.photo_library, color: Colors.lightBlue),
            Icon(Icons.favorite_border, color: Colors.grey),
            Icon(Icons.album, color: Colors.grey),
            Icon(Icons.search, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
