import 'package:flutter/material.dart';
import 'package:flutter_onboarding_subscription/utils/fade_animation.dart';

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
  int plan = 0;
  @override
  Widget build(BuildContext context) {
    Widget card(
        {String? type, int? index, String? text, StateSetter? setModalState}) {
      return GestureDetector(
        onTap: () {
          setModalState!(() {
            plan = index!;
          });
        },
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                  width: 2,
                  color:
                      index == plan ? Color(0xff36C688) : Color(0xff25232c))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(type!,
                      style: TextStyle(
                          letterSpacing: 2,
                          color: Colors.grey,
                          fontWeight: FontWeight.w700)),
                  Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color:
                                index == plan ? Color(0xff36C688) : Colors.grey,
                            width: index == plan ? 6 : 2)),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                text!,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.white),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: Color(0xff36C688).withAlpha(50),
                        borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: Text('One week free trial',
                          style: TextStyle(
                              fontSize: 10,
                              color: Color(0xff36C688),
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text('then $text. Cancel anytime',
                  style: TextStyle(color: Colors.grey, fontSize: 12))
            ],
          ),
        ),
      );
    }

    Future<dynamic> modal() {
      return showModalBottomSheet(
          enableDrag: true,
          isScrollControlled: true,
          context: context,
          backgroundColor: Color(0xff25232C),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(24))),
          builder: (_) {
            return StatefulBuilder(
                builder: (BuildContext context, StateSetter setModalState) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(right: 30, left: 30, bottom: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.drag_handle, color: Colors.grey),
                      Text('Select Subscription',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      SizedBox(
                        height: 12,
                      ),
                      card(
                          index: 0,
                          text: '\$17.99/month',
                          type: 'MONTHLY',
                          setModalState: setModalState),
                      SizedBox(
                        height: 24,
                      ),
                      card(
                          index: 1,
                          text: '\$169.99/month',
                          type: 'ANNUALLY',
                          setModalState: setModalState),
                      SizedBox(
                        height: 24,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return AlertDialog(
                                  content: Container(
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Color(0xff36C688),
                                          size: 48,
                                        ),
                                        Text('Success',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 20))
                                      ],
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16)),
                                  backgroundColor: Color(0xff1D1B24),
                                );
                              });
                        },
                        child: Container(
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xff36C688),
                              borderRadius: BorderRadius.circular(16)),
                          child: Center(
                              child: Text(
                            'Proceed Subscription',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              );
            });
          });
    }

    return Scaffold(
        backgroundColor: Color(0xff1D1B24),
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            child: Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FadeAnimation(
                        delay: 200,
                        child: Image.asset(
                          'assets/images/1.png',
                          width: 100,
                        ),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FadeAnimation(
                        delay: 400,
                        child: Text(
                            'Unlimited devices.\n10 GB monthly uploads.\n200 MB per note.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white)),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      FadeAnimation(
                        delay: 500,
                        child: Text('See also what\'s premium includes',
                            style: TextStyle(color: Colors.grey)),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FadeAnimation(
                        delay: 500,
                        child: Text('Starting at \$17.99/month',
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 12)),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      GestureDetector(
                        onTap: () {
                          modal();
                        },
                        child: FadeAnimation(
                          delay: 600,
                          child: Container(
                            width: double.infinity,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xff36C688),
                                borderRadius: BorderRadius.circular(16)),
                            child: Center(
                                child: Text(
                              'Go Premium',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
