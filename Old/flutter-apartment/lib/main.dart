import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
      theme: ThemeData(fontFamily: 'Urbanist'),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> images = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
  ];
  List<String> names = [
    'Walk-Up Apartment',
    'Kovan Apartments',
    'Garden Apartment'
  ];
  List<String> locations = [
    'Jakarta, Indonesia',
    'Surabaya, Indonesia',
    'Bandung, Indonesia'
  ];
  int index = 0;
  int? active;

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFEFEFE),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Apartment',
            style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              active != null
                  ? SizedBox(
                      height: 120,
                      width: double.infinity,
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 160,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.blue.shade300,
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ]),
                          child: const Center(
                              child: Text('Rent Now',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600))),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Best Offers',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w800)),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: Colors.yellow.shade800,
                          borderRadius: BorderRadius.circular(4)),
                      child: const Center(
                        child: Text('3',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                CarouselSlider(
                    items: [0, 1, 2].map((i) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            active = i;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 12),
                          padding: const EdgeInsets.all(8),
                          height: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: active == i
                                      ? Colors.blue
                                      : Colors.transparent,
                                  width: 3),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: [
                                BoxShadow(
                                    color: active == i
                                        ? Colors.blue.shade200
                                        : Colors.grey.shade300,
                                    blurRadius: 12,
                                    spreadRadius: 1)
                              ]),
                          child: Column(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(24),
                                      image: DecorationImage(
                                          image: AssetImage(images[i]),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              Text(names[index],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 20)),
                              const SizedBox(
                                height: 4,
                              ),
                              Text(locations[index],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      color: Colors.grey.shade700)),
                              const SizedBox(
                                height: 16,
                              )
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      onPageChanged: (i, r) {
                        setState(() {
                          index = i;
                        });
                      },
                      enableInfiniteScroll: false,
                      scrollPhysics: const BouncingScrollPhysics(),
                      aspectRatio: 1,
                      height: 500,
                      enlargeCenterPage: true,
                    )),
                const SizedBox(
                  height: 72,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
