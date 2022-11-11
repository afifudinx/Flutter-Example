import 'dart:async';

import 'package:flutter/material.dart';

class Verification extends StatefulWidget {
  final email;
  const Verification({Key? key, this.email}) : super(key: key);

  @override
  _VerificationState createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  FocusNode _field1 = FocusNode();
  FocusNode _field2 = FocusNode();
  FocusNode _field3 = FocusNode();
  FocusNode _field4 = FocusNode();
  bool isWaiting = false;
  bool isSucess = false;

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
      decoration: BoxDecoration(
          color: Colors.blue.shade50, borderRadius: BorderRadius.circular(16)),
      width: 64,
      child: TextFormField(
          autofocus: autofocus,
          focusNode: focus,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.w500),
          onChanged: (e) {
            next != null ? nextField(value: e, focus: next) : null;
          },
          decoration: InputDecoration(
              fillColor: Colors.green,
              border: OutlineInputBorder(borderSide: BorderSide.none))),
    );
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
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50, shape: BoxShape.circle),
                    child: Center(
                        child: Icon(Icons.arrow_back, color: Colors.blue)),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Text('OTP Verification',
                    style:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.w800)),
                SizedBox(
                  height: 12,
                ),
                Text('Verification mail has been sent to ${widget.email}',
                    style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 48,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      field(focus: _field1, next: _field2, autofocus: true),
                      field(focus: _field2, next: _field3),
                      field(focus: _field3, next: _field4),
                      field(focus: _field4),
                    ]),
                SizedBox(
                  height: 48,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isWaiting = true;
                    });
                    Timer.periodic(Duration(seconds: 2), (timer) {
                      setState(() {
                        isWaiting = false;
                        isSucess = true;
                      });
                    });
                  },
                  child: Container(
                    height: 64,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade700,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                        child: isWaiting
                            ? SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                            : Text(isSucess ? 'Success' : 'Continue',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white))),
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
