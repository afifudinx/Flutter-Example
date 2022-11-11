import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDark = false;

  Widget form(String placeholder) {
    return Container(
      height: 54,
      width: double.infinity,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
          color: isDark ? Colors.grey.shade900 : Colors.grey.shade200,
          border: Border.all(color: Colors.blue, width: 2),
          borderRadius: BorderRadius.circular(12)),
      child: Align(
        alignment: Alignment.center,
        child: TextField(
            style: GoogleFonts.inter(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: isDark ? Colors.grey.shade200 : Colors.grey.shade800),
            decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                isCollapsed: true,
                isDense: true,
                hintText: placeholder,
                hintStyle: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: isDark ? Colors.grey.shade600 : Colors.grey.shade400),
                border: InputBorder.none)),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: isDark ? Color(0xff101010) : Colors.grey.shade50,
      elevation: 0,
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.arrow_back_ios,
            color: isDark ? Colors.grey.shade50 : Color(0xff101010),
          )),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                isDark = !isDark;
              });
            },
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode,
                color: isDark ? Colors.grey.shade50 : Color(0xff101010)))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: isDark ? Color(0xff101010) : Colors.grey.shade50,
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome Back!',
                        style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: isDark ? Colors.white : Color(0xff101010))),
                    SizedBox(
                      height: 6,
                    ),
                    Text('Sign in to your account',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500, color: Colors.grey)),
                    SizedBox(
                      height: 48,
                    ),
                    Text('Email',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.grey.shade200 : Colors.grey.shade800)),
                    SizedBox(
                      height: 8,
                    ),
                    form('myemail@example.com'),
                    SizedBox(
                      height: 36,
                    ),
                    Text('Password',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            color: isDark ? Colors.grey.shade200 : Colors.grey.shade800)),
                    SizedBox(
                      height: 8,
                    ),
                    form('Your password'),
                    SizedBox(
                      height: 36,
                    ),
                    Container(
                      height: 54,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Colors.blue, Colors.lightBlueAccent]),
                          borderRadius: BorderRadius.circular(12)),
                      child: Center(
                        child: Text('Login',
                            style: GoogleFonts.inter(
                                fontWeight: FontWeight.w700, color: Colors.grey.shade200)),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Dont have an account?',
                            style: GoogleFonts.inter(
                                color: isDark ? Colors.grey.shade600 : Colors.grey.shade400,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          width: 4,
                        ),
                        Text('Sign Up',
                            style: GoogleFonts.inter(
                                color: Colors.blue, fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
