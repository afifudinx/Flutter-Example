import 'package:flutter/material.dart';
import 'package:flutter_travel_app/constants/theme.dart';
import 'package:flutter_travel_app/models/destination.dart';
import 'package:flutter_travel_app/pages/detail.dart';
import 'package:flutter_travel_app/utils/fade_animation.dart';

void main() => runApp(MaterialApp(
    routes: {'/': (context) => MyApp(), '/detail': (context) => DetailPage()},
    debugShowCheckedModeBanner: false));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Destination> recommendList = [
    Destination(
        name: 'Wilson Island Tour',
        imageUrl: 'assets/images/wilson.png',
        location: 'Maldives, Asia',
        rating: 4.9),
    Destination(
        name: 'St. Lucia Island',
        imageUrl: 'assets/images/lucia.png',
        location: 'Saint Lucia',
        rating: 4.9)
  ];

  final List<Destination> packages = [
    Destination(
        name: 'Alesund viewpoint package',
        imageUrl: 'assets/images/alesund.png',
        location: 'Norway'),
    Destination(
        name: 'Manarola viewpoint package',
        imageUrl: 'assets/images/manarola.png',
        location: 'La Spezia, Italy'),
    Destination(
        name: 'Heceta head viewpoint package',
        imageUrl: 'assets/images/heceta.png',
        location: 'Florence, USA'),
  ];

  Widget recommendCard(int index, int listLength, Destination dest) {
    return FadeAnimation(
      delay: 400 * (index + 1),
      isHorizontal: true,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/detail');
        },
        child: Container(
            margin: EdgeInsets.only(
                top: mdSpacing,
                bottom: mdSpacing,
                left: index == 0 ? margin : 0,
                right: index == listLength - 1 ? margin : 16),
            width: 240,
            decoration: BoxDecoration(
                color: bgElevated,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                      color: Colors.blueGrey.withOpacity(0.1),
                      offset: Offset(4, 4),
                      blurRadius: 8,
                      spreadRadius: 0)
                ]),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                      image: DecorationImage(
                          image: AssetImage(dest.imageUrl!), fit: BoxFit.cover)),
                )),
                Container(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(dest.name!, style: lgTextStyle.copyWith(fontSize: 14)),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset('assets/icons/location.png', width: 12),
                              SizedBox(
                                width: smSpacing,
                              ),
                              Text(dest.location!,
                                  style: smTextStyle.copyWith(color: tertaryColor))
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icons/start.png',
                            width: 12,
                          ),
                          SizedBox(
                            width: smSpacing,
                          ),
                          Text('${dest.rating}',
                              style: smTextStyle.copyWith(color: tertaryColor))
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgPrimary,
      appBar: appBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: spacing,
              ),
              hero(),
              SizedBox(
                height: spacing,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: margin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Recommended', style: lgTextStyle.copyWith(color: primaryColor)),
                        Text('View All', style: smTextStyle.copyWith(color: accentColor))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: smSpacing,
                  ),
                  Container(
                    height: 320,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: recommendList.length,
                      itemBuilder: (context, index) {
                        return recommendCard(
                            index, recommendList.length, recommendList[index]);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: spacing,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: margin),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Popular Packages',
                          style: lgTextStyle.copyWith(color: primaryColor)),
                      Text('View All', style: smTextStyle.copyWith(color: accentColor))
                    ],
                  ),
                  SizedBox(
                    height: smSpacing,
                  ),
                  FadeAnimation(delay: 1000, child: packageCard(packages[0])),
                  FadeAnimation(delay: 1200, child: packageCard(packages[1])),
                  FadeAnimation(delay: 1400, child: packageCard(packages[2])),
                ]),
              ),
              SizedBox(
                height: spacing,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

PreferredSize appBar() {
  return PreferredSize(
    preferredSize: Size(double.infinity, 72),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: margin),
      color: bgSecondary,
      child: SafeArea(
        left: false,
        right: false,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                'assets/icons/menu.png',
                width: 30,
                height: 30,
              ),
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'), fit: BoxFit.cover)),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget hero() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: margin),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hello Jessica',
          style: xlTextStyle.copyWith(color: primaryColor),
        ),
        SizedBox(
          height: smSpacing,
        ),
        Text('Let’s discover best package for you.',
            style: baseTextStyle.copyWith(color: secondaryColor)),
        SizedBox(height: spacing),
        FadeAnimation(
          delay: 400,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                height: 54,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: bgSecondary, borderRadius: BorderRadius.circular(12)),
                child: Align(
                  alignment: Alignment.center,
                  child: TextField(
                    style: baseTextStyle.copyWith(color: primaryColor),
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        isCollapsed: true,
                        isDense: true,
                        hintText: 'Search for your favorite place here',
                        hintStyle: baseTextStyle.copyWith(color: tertaryColor),
                        prefixIconConstraints: BoxConstraints(
                            maxWidth: 36, minWidth: 36, maxHeight: 36, minHeight: 36),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.asset('assets/icons/search.png'),
                        )),
                  ),
                ),
              )),
              SizedBox(
                width: mdSpacing,
              ),
              Container(
                height: 54,
                width: 54,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: bgSecondary,
                ),
                child: Center(child: Image.asset('assets/icons/filter.png')),
              )
            ],
          ),
        )
      ],
    ),
  );
}

Widget packageCard(Destination package) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: mdSpacing),
    width: double.infinity,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(color: bgElevated, borderRadius: BorderRadius.circular(12)),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            package.imageUrl!,
            width: 64,
          ),
        ),
        SizedBox(
          width: mdSpacing,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(package.name!,
                style:
                    baseTextStyle.copyWith(fontWeight: FontWeight.w600, color: primaryColor)),
            Row(
              children: [
                Image.asset('assets/icons/location.png', width: 12),
                Text(package.location!, style: smTextStyle.copyWith(color: tertaryColor))
              ],
            )
          ],
        )
      ],
    ),
  );
}
