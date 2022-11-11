import 'package:flutter/material.dart';
import 'package:flutter_watch_app/pages/detail.dart';
import 'package:flutter_watch_app/utils/slide_route.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          return RouteAnimation.slide(settings, const DetailPage());
        }
        return RouteAnimation.slide(settings, const MyApp());
      },
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
        backgroundColor: const Color(0xffE3EFEF),
        body: Stack(
          children: [
            Image.asset('assets/images/watch.jpg'),
            Container(
              padding: const EdgeInsets.all(30),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Xiaomi Mi Band',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w800, fontSize: 36)),
                  const SizedBox(
                    height: 12,
                  ),
                  Text('Military-grade sensor, 30 day battery',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade700)),
                  const SizedBox(
                    height: 160,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/detail');
                    },
                    child: Container(
                        height: 60,
                        width: 160,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(99),
                        ),
                        child: const Center(
                            child: Icon(Icons.arrow_forward,
                                color: Colors.white))),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
