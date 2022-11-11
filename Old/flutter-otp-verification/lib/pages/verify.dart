import 'package:flutter/material.dart';
import 'package:flutter_otp_verification/utils/fade_animation.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifyPage extends StatefulWidget {
  final number;
  const VerifyPage({Key? key, int? this.number}) : super(key: key);

  @override
  _VerifyPageState createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  final FocusNode _field1 = FocusNode();
  final FocusNode _field2 = FocusNode();
  final FocusNode _field3 = FocusNode();
  final FocusNode _field4 = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _field1.dispose();
    _field2.dispose();
    _field3.dispose();
    _field4.dispose();
    super.dispose();
  }

  void nextField({String? value, FocusNode? focus}) {
    if (value!.length == 1) {
      focus!.requestFocus();
    }
  }

  Widget field({FocusNode? focus, FocusNode? next, bool autofocus = false}) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 1,
            offset: const Offset(0, 2),
            spreadRadius: 1)
      ], color: Colors.grey.shade200, borderRadius: BorderRadius.circular(12)),
      width: 64,
      child: TextFormField(
          autofocus: autofocus,
          focusNode: focus,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500),
          onChanged: (e) {
            next != null ? nextField(value: e, focus: next) : null;
          },
          decoration: const InputDecoration(
              fillColor: Colors.green,
              border: OutlineInputBorder(borderSide: BorderSide.none))),
    );
  }

  //////////////////////////////
  ///
  /// follow @withflutter
  ///
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          ),
          centerTitle: true,
          title: Text('Continue with Phone',
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ),
        body: Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FadeAnimation(
                    delay: 0,
                    child: Text('Code is sent to +62${widget.number}',
                        style: GoogleFonts.inter(color: Colors.grey.shade700)),
                  ),
                  const SizedBox(
                    height: 96,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FadeAnimation(
                          delay: 200,
                          child: field(
                              focus: _field1, next: _field2, autofocus: true)),
                      FadeAnimation(
                          delay: 400,
                          child: field(focus: _field2, next: _field3)),
                      FadeAnimation(
                          delay: 600,
                          child: field(focus: _field3, next: _field4)),
                      FadeAnimation(delay: 800, child: field(focus: _field4)),
                    ],
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  FadeAnimation(
                    delay: 200,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Didn\'t receive code? ',
                            style: GoogleFonts.inter(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500)),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text('Request again',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w500)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  FadeAnimation(
                    delay: 400,
                    child: Text('Get via call',
                        style: GoogleFonts.inter(fontWeight: FontWeight.w500)),
                  ),
                  const Spacer(),
                  FadeAnimation(
                    delay: 600,
                    child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text('Continue',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        )),
                  )
                ])));
  }
}
