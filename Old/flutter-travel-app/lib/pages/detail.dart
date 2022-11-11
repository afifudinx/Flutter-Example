import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_travel_app/constants/theme.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<String> activities = [
    'assets/images/activity1.jpg',
    'assets/images/activity2.jpg',
    'assets/images/activity3.jpg',
  ];
  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: Size(double.infinity, 72),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: margin),
        color: Colors.transparent,
        child: SafeArea(
          left: false,
          right: false,
          child: Align(
            alignment: Alignment.center,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                          child: Icon(Icons.arrow_back, color: Colors.white)),
                    ),
                  ),
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                        child: Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.5)),
                            child: Icon(Icons.favorite, color: Colors.white))))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: bgPrimary,
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/wilson.png'), fit: BoxFit.cover)),
            ),
            Transform.translate(
              offset: Offset(0, -50),
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(spacing),
                      width: 300,
                      decoration: BoxDecoration(
                          color: bgElevated,
                          borderRadius: BorderRadius.circular(24),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.blueGrey.withOpacity(0.1),
                                offset: Offset(4, 4),
                                blurRadius: 8,
                                spreadRadius: 0)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Wilson Island Tour',
                              style: xlTextStyle.copyWith(color: primaryColor)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('\$499.00',
                                  style: xlTextStyle.copyWith(color: accentColor)),
                              Row(
                                children: [
                                  Image.asset('assets/icons/location.png',
                                      width: 12, color: primaryColor),
                                  SizedBox(
                                    width: smSpacing,
                                  ),
                                  Text(
                                    'Maldives, Asia',
                                    style: baseTextStyle.copyWith(color: primaryColor),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: mdSpacing,
                    ),
                    DefaultTabController(
                        length: 4,
                        child: Container(
                          width: double.infinity,
                          child: Column(
                            children: [
                              TabBar(
                                  labelColor: accentColor,
                                  labelStyle: baseTextStyle,
                                  unselectedLabelStyle: baseTextStyle,
                                  unselectedLabelColor: secondaryColor,
                                  indicatorColor: accentColor,
                                  padding: EdgeInsets.symmetric(horizontal: margin),
                                  isScrollable: true,
                                  tabs: [
                                    Tab(
                                      text: 'Details',
                                    ),
                                    Tab(
                                      text: 'Reviews',
                                    ),
                                    Tab(
                                      text: 'Budget',
                                    ),
                                    Tab(
                                      text: 'Highlights',
                                    ),
                                  ]),
                              SizedBox(
                                height: mdSpacing,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: margin),
                                child: Text(
                                    'Wilson island appeals through its sheer natural beauty of loom volcanoes and lush terraced rice fields that exude peace and  serenity. Wilson enchancts with its dramatic and colourful of a ceremonies',
                                    style: baseTextStyle.copyWith(color: tertaryColor)),
                              )
                            ],
                          ),
                        )),
                    SizedBox(
                      height: spacing,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: margin,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Activities',
                                style: lgTextStyle.copyWith(color: primaryColor)),
                            Text('View All',
                                style: smTextStyle.copyWith(
                                    fontWeight: FontWeight.w600, color: accentColor))
                          ],
                        )),
                    SizedBox(
                      height: mdSpacing,
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: activities.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(
                                left: index == 0 ? margin : 12,
                                right: index == activities.length - 1 ? margin : 0),
                            width: 150,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: AssetImage(activities[index]), fit: BoxFit.cover)),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: margin, vertical: 14),
        color: Colors.white,
        height: 80,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total Price',
                    style: smTextStyle.copyWith(fontSize: 10, color: secondaryColor),
                  ),
                  Text('\$499.00',
                      style: xlTextStyle.copyWith(fontSize: 20, color: accentColor))
                ],
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                      color: accentColor, borderRadius: BorderRadius.circular(16)),
                  child: Center(
                      child:
                          Text('Book Now', style: lgTextStyle.copyWith(color: Colors.white))))
            ],
          ),
        ),
      ),
    );
  }
}
