import 'package:flutter/material.dart';
import 'package:flutter_watch_app/utils/fade_animation.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  TextStyle paragraph = GoogleFonts.inter(
      color: Colors.grey.shade800, fontWeight: FontWeight.w600);

  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE3EFEF),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 24,
            ),
            Image.asset('assets/images/watch2.jpg'),
            const SizedBox(
              height: 24,
            ),
            FadeAnimation(
              delay: 0,
              child: Text('Xiaomi Mi Band',
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w800, fontSize: 30)),
            ),
            const SizedBox(
              height: 24,
            ),
            FadeAnimation(
              delay: 200,
              child: Text(
                  'new features include menstruation cycle tracking, breath training, remote control for your smartphone camera, and a new PAI Vitality Index',
                  style: paragraph),
            ),
            const SizedBox(
              height: 24,
            ),
            FadeAnimation(
              delay: 200,
              child: Text('Band Color',
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700)),
            ),
            const SizedBox(
              height: 24,
            ),
            FadeAnimation(
              delay: 400,
              isHorizontal: true,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 0;
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index == 0
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2),
                          color: Colors.yellow,
                          shape: BoxShape.circle),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 1;
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index == 1
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2),
                          color: Colors.orange,
                          shape: BoxShape.circle),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 2;
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index == 2
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2),
                          color: Colors.cyan,
                          shape: BoxShape.circle),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 3;
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index == 3
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2),
                          color: Colors.blue,
                          shape: BoxShape.circle),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 4;
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index == 4
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2),
                          color: Colors.pink,
                          shape: BoxShape.circle),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        index = 5;
                      });
                    },
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: index == 5
                                  ? Colors.black
                                  : Colors.transparent,
                              width: 2),
                          color: Colors.green,
                          shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FadeAnimation(
                  delay: 600,
                  child: Text('\$200',
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 24)),
                ),
                FadeAnimation(
                  delay: 800,
                  child: Container(
                    height: 60,
                    width: 160,
                    decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(12)),
                    child: Center(
                        child: Text('BUY NOW',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700,
                                color: Colors.white))),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
