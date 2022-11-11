import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isObscure = true;
  PreferredSizeWidget appBar() {
    return AppBar(
      backgroundColor: Color(0xff090910),
      elevation: 0,
      leading: Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(Icons.arrow_back),
            Text(
              'Back',
              style: GoogleFonts.inter(fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
      leadingWidth: 200,
    );
  }

  Widget username({String? placeholder, String? name}) {
    return Container(
        height: 48,
        decoration: BoxDecoration(
            color: Color(0xff222328), borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 72,
              child: Text(name!,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, color: Color(0xff5C5D62))),
            ),
            VerticalDivider(thickness: 1, color: Color(0xff5C5D62)),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: TextField(
                    style: GoogleFonts.inter(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(4),
                      isCollapsed: true,
                      isDense: true,
                      border: InputBorder.none,
                      hintStyle: GoogleFonts.inter(color: Color(0xff5C5D62)),
                      hintText: placeholder!,
                    )))
          ],
        ));
  }

  Widget password({String? placeholder, String? name}) {
    return Container(
        height: 48,
        decoration: BoxDecoration(
            color: Color(0xff222328), borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 72,
              child: Text(name!,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, color: Color(0xff5C5D62))),
            ),
            VerticalDivider(thickness: 1, color: Color(0xff5C5D62)),
            SizedBox(
              width: 12,
            ),
            Expanded(
                child: TextField(
                    obscureText: isObscure,
                    style: GoogleFonts.inter(
                        color: Colors.white, fontWeight: FontWeight.w500),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(4),
                        isCollapsed: true,
                        isDense: true,
                        border: InputBorder.none,
                        hintStyle: GoogleFonts.inter(color: Color(0xff5C5D62)),
                        hintText: placeholder!,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscure = !isObscure;
                              });
                            },
                            child: isObscure
                                ? Icon(Icons.visibility_off,
                                    color: Color(0xff2C2891))
                                : Icon(Icons.visibility,
                                    color: Color(0xff5C5D62))))))
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff090910),
        appBar: appBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 12, horizontal: 12),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Sign In',
                        style: GoogleFonts.inter(
                            color: Colors.white,
                            fontSize: 36,
                            fontWeight: FontWeight.w700)),
                    SizedBox(height: 24),
                    username(name: 'Email', placeholder: 'example@email.com'),
                    SizedBox(
                      height: 12,
                    ),
                    password(name: 'Password', placeholder: 'password'),
                    SizedBox(
                      height: 6,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text('Forgot password?',
                          style: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff5C5D62))),
                    ),
                    SizedBox(height: 24),
                    Container(
                        height: 48,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Color(0xff2C2891)),
                        child: Center(
                            child: Text('Continue',
                                style: GoogleFonts.inter(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500)))),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
