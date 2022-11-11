import 'package:flutter/material.dart';
import 'package:flutter_keyboard_store/utils/fade_animation.dart';

class KeyboardPage extends StatefulWidget {
  const KeyboardPage({Key? key}) : super(key: key);

  @override
  _KeyboardPageState createState() => _KeyboardPageState();
}

class _KeyboardPageState extends State<KeyboardPage> {
  int switchIndex = 0;
  bool isFavorite = false;
  Widget switchColor(Color color, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switchIndex = index;
        });
      },
      child: Container(
        height: 48,
        width: 48,
        decoration: BoxDecoration(
            color: switchIndex == index ? color : color.withOpacity(0.5),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffF7F8FA),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon:
                  const Icon(Icons.shopping_cart_outlined, color: Colors.black))
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            FadeAnimation(
              delay: 0,
              child: Container(
                height: 240,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade300,
                          blurRadius: 10,
                          spreadRadius: 5)
                    ],
                    image: const DecorationImage(
                        image: AssetImage('assets/images/3.jpg'),
                        fit: BoxFit.cover)),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const FadeAnimation(
              delay: 200,
              child: Text('Cherry MX',
                  style: TextStyle(
                      fontWeight: FontWeight.w800, color: Colors.black54)),
            ),
            const FadeAnimation(
              delay: 200,
              child: Text('Mechanical Keyboard',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24)),
            ),
            const SizedBox(
              height: 16,
            ),
            const FadeAnimation(
              delay: 200,
              child: Text('\$200.00',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 20)),
            ),
            const SizedBox(
              height: 32,
            ),
            const FadeAnimation(
              delay: 200,
              child: Text('Switch',
                  style: TextStyle(
                      fontWeight: FontWeight.w700, color: Colors.black87)),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FadeAnimation(
                    delay: 200,
                    isHorizontal: true,
                    child: switchColor(Colors.blue, 0)),
                FadeAnimation(
                    delay: 400,
                    isHorizontal: true,
                    child: switchColor(Colors.brown, 1)),
                FadeAnimation(
                    delay: 600,
                    isHorizontal: true,
                    child: switchColor(Colors.red, 2)),
                FadeAnimation(
                    delay: 800,
                    isHorizontal: true,
                    child: switchColor(Colors.green, 3)),
              ],
            ),
            const Spacer(),
            Column(
              children: [
                FadeAnimation(
                  delay: 400,
                  child: Container(
                    height: 48,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              blurRadius: 5,
                              spreadRadius: 1,
                              color: Colors.blue.shade300)
                        ]),
                    child: const Center(
                      child: Text('Buy Now',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: Colors.white)),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isFavorite = !isFavorite;
                        });
                      },
                      child: FadeAnimation(
                        delay: 500,
                        child: Container(
                          height: 48,
                          width: 48,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ]),
                          child: Center(
                            child: isFavorite
                                ? const Icon(Icons.favorite, color: Colors.blue)
                                : const Icon(Icons.favorite_outline),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: FadeAnimation(
                        delay: 600,
                        child: Container(
                          height: 48,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.shade200,
                                    blurRadius: 5,
                                    spreadRadius: 1)
                              ]),
                          child: const Center(
                            child: Text(
                              'Add To Cart',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
