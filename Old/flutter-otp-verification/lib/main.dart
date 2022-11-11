import 'package:flutter/material.dart';
import 'package:flutter_otp_verification/pages/verify.dart';
import 'package:google_fonts/google_fonts.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _numberController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, color: Colors.black),
          ),
          centerTitle: true,
          title: Text('Enter Your Phone Number',
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600))),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade300,
                        blurRadius: 1,
                        offset: const Offset(0, 3),
                        spreadRadius: 1)
                  ]),
              child: TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(16),
                    border: InputBorder.none,
                    isCollapsed: true,
                    isDense: true,
                    prefix: Text('+62',
                        style: GoogleFonts.inter(
                            fontWeight: FontWeight.w700, color: Colors.black))),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return VerifyPage(
                      number: int.tryParse(_numberController.text));
                }));
              },
              child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text('Continue',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          )))),
            )
          ],
        ),
      ),
    );
  }
}
