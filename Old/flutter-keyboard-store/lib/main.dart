import 'package:flutter/material.dart';
import 'package:flutter_keyboard_store/pages/keyboard_page.dart';
import 'package:flutter_keyboard_store/utils/fade_animation.dart';
import 'package:flutter_keyboard_store/utils/slide_route.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'urbanist'),
      onGenerateRoute: (settings) {
        if (settings.name == '/keyboard') {
          return RouteAnimation.slide(settings, const KeyboardPage());
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
  List<String> categories = [
    'Mechanical',
    'Membrance',
    'Wireless',
    'Ergonomic'
  ];
  int categorySelected = 0;
  List<String> productImages = [
    'assets/images/3.jpg',
    'assets/images/2.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu, color: Colors.black),
        ),
        title: const Text('Keystore',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black))
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            FadeAnimation(
              delay: 0,
              child: Container(
                margin: const EdgeInsets.all(24),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        image: AssetImage('assets/images/1.jpg'),
                        fit: BoxFit.cover)),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: const LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('50% OFF',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w800)),
                      Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: const LinearGradient(
                                  colors: [Colors.orange, Colors.purple])),
                          child: const Text('Buy Now',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return FadeAnimation(
                    delay: index * 200,
                    isHorizontal: true,
                    child: Container(
                      margin: EdgeInsets.only(
                          left: index == 0 ? 30 : 0,
                          right: index == categories.length - 1 ? 30 : 10),
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              categorySelected = index;
                            });
                          },
                          child: Container(
                              height: 40,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  color: index == categorySelected
                                      ? Colors.blue
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                        color: index == categorySelected
                                            ? Colors.blue.shade200
                                            : Colors.grey.shade200,
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ]),
                              child: Center(
                                  child: Text(categories[index],
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          color: index == categorySelected
                                              ? Colors.white
                                              : Colors.black87)))),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Latest Products',
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 20)),
                  Text('See all',
                      style: TextStyle(
                          fontWeight: FontWeight.w700, color: Colors.blue))
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            SizedBox(
              height: 300,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: productImages.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/keyboard');
                    },
                    child: FadeAnimation(
                      delay: (index + 1) * 200,
                      isHorizontal: true,
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 5,
                                  spreadRadius: 1)
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        margin: EdgeInsets.only(
                            bottom: 4,
                            left: index == 0 ? 30 : 0,
                            right: index == categories.length - 1 ? 30 : 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 200,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(productImages[index]),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(12)),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('Mechanical Keyboard',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700)),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('\$200.00',
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.blue)),
                                        Container(
                                            padding: const EdgeInsets.all(12),
                                            decoration: BoxDecoration(
                                                boxShadow: [
                                                  BoxShadow(
                                                      color:
                                                          Colors.blue.shade200,
                                                      blurRadius: 5,
                                                      spreadRadius: 1)
                                                ],
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: const Center(
                                                child: Text('View Details',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        color: Colors.white))))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        ),
      ),
    );
  }
}
