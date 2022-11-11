import 'package:flutter/material.dart';
import 'package:flutter_email_app/context/context.dart';
import 'package:flutter_email_app/utils/fade_animation.dart';
import 'package:flutter_email_app/utils/system_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MailPage extends StatefulWidget {
  const MailPage({Key? key}) : super(key: key);

  @override
  _MailPageState createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    systemUi();
    return Scaffold(
        appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:
                    const Icon(Icons.arrow_back_ios_new, color: Colors.black)),
            centerTitle: true,
            title: Text('Send Email',
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, color: Colors.black))),
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              Consumer<AppContext>(builder: (context, value, child) {
                return Hero(
                  tag: value.image,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(999),
                      child: Image.asset(
                        value.image,
                        width: 96,
                        height: 96,
                      )),
                );
              }),
              const SizedBox(
                height: 24,
              ),
              Consumer<AppContext>(builder: (context, value, child) {
                return FadeAnimation(
                  delay: 200,
                  child: Text(value.name,
                      style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700, fontSize: 24)),
                );
              }),
              const SizedBox(
                height: 48,
              ),
              FadeAnimation(
                delay: 400,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 64,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: TextField(
                        maxLines: 2,
                        style: GoogleFonts.inter(
                            color: Colors.black, fontWeight: FontWeight.w700),
                        decoration: InputDecoration(
                            hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade400),
                            hintText: 'Subject',
                            border: InputBorder.none,
                            isCollapsed: true,
                            isDense: true)),
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              FadeAnimation(
                delay: 800,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  height: 144,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300, width: 2),
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: TextField(
                        maxLines: 6,
                        style: GoogleFonts.inter(
                            color: Colors.black, fontWeight: FontWeight.w500),
                        decoration: InputDecoration(
                            hintStyle: GoogleFonts.inter(
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade400),
                            hintText: 'Message',
                            border: InputBorder.none,
                            isCollapsed: true,
                            isDense: true)),
                  ),
                ),
              ),
              const Spacer(),
              FadeAnimation(
                delay: 1000,
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                    child: Text('Send',
                        style: GoogleFonts.inter(
                            color: Colors.white, fontWeight: FontWeight.w500)),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
