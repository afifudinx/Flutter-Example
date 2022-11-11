import 'package:flutter/material.dart';
import 'package:flutter_laundry_app/pages/details.dart';
import 'package:flutter_laundry_app/pages/picktime.dart';
import 'package:flutter_laundry_app/utils/fade_animation.dart';
import 'package:flutter_laundry_app/utils/slide_route.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          return RouteAnimation.slide(settings, const DetailPage());
        } else if (settings.name == '/picktime') {
          return RouteAnimation.slide(settings, const PickTimePage());
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
  final List<Map<String, String>> services = [
    {'name': 'Washing', 'image': 'washing.png'},
    {'name': 'Ironing', 'image': 'iron.png'},
    {'name': 'Drying', 'image': 'drying.png'},
    {'name': 'Sewing', 'image': 'sewing.png'},
  ];

  int? selected;

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF1F1F1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text('Laundry',
            style: GoogleFonts.inter(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w600)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () {},
        ),
      ),
      floatingActionButton: selected != null
          ? GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/detail');
              },
              child: Container(
                  height: 60,
                  width: 60,
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blue, blurRadius: 5, spreadRadius: 1)
                      ]),
                  child:
                      const Icon(Icons.arrow_forward_ios, color: Colors.white)),
            )
          : const SizedBox(),
      body: Container(
        padding: const EdgeInsets.all(24),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            FadeAnimation(
              delay: 0,
              child: Text('Muhammad Afifudin',
                  style: GoogleFonts.inter(
                      color: Colors.black87,
                      fontSize: 36,
                      fontWeight: FontWeight.w700)),
            ),
            FadeAnimation(
              delay: 200,
              child: Text('\$200.00',
                  style: GoogleFonts.inter(
                      color: Colors.pink,
                      fontSize: 24,
                      fontWeight: FontWeight.w700)),
            ),
            const Spacer(),
            GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(vertical: 12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = index;
                      });
                    },
                    child: FadeAnimation(
                      delay: 300 * (index + 1),
                      child: Card(
                        color: selected == index
                            ? Colors.blue.shade50
                            : Colors.white,
                        shadowColor: Colors.blue,
                        elevation: selected == index ? 4 : 0,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                              color: selected == index
                                  ? Colors.blue
                                  : Colors.white,
                              width: 4,
                            ),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/${services[index]['image']}',
                              height: 100,
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Text(services[index]['name']!,
                                style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600))
                          ],
                        ),
                      ),
                    ),
                  );
                }),
            const SizedBox(height: 48)
          ],
        ),
      ),
    );
  }
}
