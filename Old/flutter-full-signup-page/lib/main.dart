import 'package:flutter/material.dart';
import 'package:flutter_full_signup_page/pages/verification.dart';
import 'package:flutter_full_signup_page/utils/fade_animation.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'Jakarta'),
    home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _emailController = TextEditingController(text: '');
  bool isObscure = true;
  bool isAgree = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 48,
                      width: 48,
                      decoration: BoxDecoration(
                          color: Colors.blue.shade50, shape: BoxShape.circle),
                      child: Center(
                          child: Icon(Icons.arrow_back, color: Colors.blue)),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    FadeAnimation(
                      delay: 0,
                      child: Text('Create\nAccount',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w800)),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    FadeAnimation(
                      delay: 100,
                      child: Text('Your Email',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    FadeAnimation(
                      delay: 200,
                      child: Container(
                          height: 64,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                              child: TextField(
                                  controller: _emailController,
                                  textAlignVertical: TextAlignVertical.center,
                                  decoration: InputDecoration(
                                      suffixIcon: Icon(Icons.check_rounded,
                                          size: 24,
                                          color:
                                              _emailController.text.isNotEmpty
                                                  ? Colors.blue.shade700
                                                  : Colors.blue.shade50),
                                      isCollapsed: true,
                                      isDense: true,
                                      border: InputBorder.none)))),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    FadeAnimation(
                      delay: 100,
                      child: Text('Password',
                          style: TextStyle(fontWeight: FontWeight.w700)),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    FadeAnimation(
                      delay: 200,
                      child: Container(
                          height: 64,
                          padding: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 12),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade50,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                              child: TextField(
                                  textAlignVertical: TextAlignVertical.center,
                                  obscureText: isObscure,
                                  decoration: InputDecoration(
                                      suffixIcon: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isObscure = !isObscure;
                                          });
                                        },
                                        child: Icon(
                                            isObscure
                                                ? Icons.visibility_off_outlined
                                                : Icons.visibility_outlined,
                                            size: 24,
                                            color: Colors.blue.shade700),
                                      ),
                                      isCollapsed: true,
                                      isDense: true,
                                      border: InputBorder.none)))),
                    ),
                    SizedBox(
                      height: 48,
                    ),
                    FadeAnimation(
                      delay: 600,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                isAgree = !isAgree;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                  color: isAgree
                                      ? Colors.blue.shade700
                                      : Colors.grey,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Icon(Icons.check, color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text('I agree to the terms and conditions',
                              style: TextStyle(fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 56,
                    ),
                    FadeAnimation(
                      delay: 800,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => Verification(
                                      email: _emailController.text)));
                        },
                        child: Container(
                          height: 64,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade700,
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                              child: Text('Sign Up',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white))),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }
}
