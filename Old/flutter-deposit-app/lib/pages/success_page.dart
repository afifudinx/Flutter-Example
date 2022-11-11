import 'package:flutter/material.dart';
import 'package:flutter_deposit_app/utils/fade_animation.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  _SuccessPageState createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xff0E0E19),
        body: SafeArea(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                  delay: 200,
                  child: Container(
                    height: 100,
                    width: 100,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.green.shade900, shape: BoxShape.circle),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.green.shade800, shape: BoxShape.circle),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            shape: BoxShape.circle),
                        child: const Center(
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                FadeAnimation(
                  delay: 300,
                  child: Text(
                    'Success',
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 18),
                  ),
                ),
                const Spacer(),
                FadeAnimation(
                  delay: 600,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade900,
                        borderRadius: BorderRadius.circular(14)),
                    child: Center(
                      child: Text('Done',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
