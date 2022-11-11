import 'package:flutter/material.dart';
import 'package:flutter_login_page/utils/fade_animation.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/': (context) => const MyApp()},
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
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FadeAnimation(
                    delay: 0, child: Image.asset('assets/images/1.png')),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FadeAnimation(
                          delay: 200,
                          child: Text('Login',
                              style: GoogleFonts.inter(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey.shade800)),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        FadeAnimation(
                          delay: 400,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 2))),
                            child: TextField(
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.grey.shade400),
                                  hintText: 'Email ID',
                                  prefixIcon: Icon(
                                    Icons.fingerprint,
                                    color: Colors.grey.shade400,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        FadeAnimation(
                          delay: 500,
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.grey.shade300,
                                        width: 2))),
                            child: TextField(
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500),
                              textAlignVertical: TextAlignVertical.center,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintStyle: GoogleFonts.inter(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      color: Colors.grey.shade400),
                                  hintText: 'Password',
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                    color: Colors.grey.shade400,
                                  ),
                                  suffixIcon: Icon(
                                    Icons.visibility_off,
                                    color: Colors.grey.shade400,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        FadeAnimation(
                          delay: 600,
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('Forgot Password?',
                                  style: GoogleFonts.inter(
                                      color: Colors.blue.shade700,
                                      fontWeight: FontWeight.w500))),
                        ),
                        const Spacer(),
                        FadeAnimation(
                          delay: 800,
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade700,
                                borderRadius: BorderRadius.circular(12)),
                            child: Center(
                              child: Text('Login',
                                  style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        FadeAnimation(
                          delay: 800,
                          child: Center(
                              child: Text(
                            'OR',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey),
                          )),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/');
                          },
                          child: FadeAnimation(
                            delay: 1000,
                            child: Container(
                              padding: const EdgeInsets.all(12),
                              height: 50,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.blue.shade50,
                                  borderRadius: BorderRadius.circular(12)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    'assets/icons/g-icon.png',
                                    width: 24,
                                    height: 24,
                                  ),
                                  const Spacer(),
                                  Text('Login with Google',
                                      style: GoogleFonts.inter(
                                          color: Colors.grey.shade700,
                                          fontWeight: FontWeight.w700)),
                                  const Spacer()
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
