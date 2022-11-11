import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
      theme: ThemeData(fontFamily: 'Urbanist'),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextStyle textStyle = const TextStyle(color: Colors.white);
  List<String> categories = ['Action', 'Adventure', 'Fantasy'];

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            expandedHeight: 500,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.pin,
              background: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/shangchi.jpg'),
                        fit: BoxFit.cover,
                        alignment: Alignment.topCenter)),
                child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.black, Colors.transparent],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter)),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Shang-Chi',
                          style: textStyle.copyWith(
                            fontSize: 42,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('and The Legend of The Ten Rings',
                            style: textStyle.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
              height: 30,
              child: ListView.builder(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      margin:
                          EdgeInsets.only(left: index == 0 ? 30 : 0, right: 12),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(99),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: Center(
                        child: Text(categories[index], style: textStyle),
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 30, left: 30, right: 30, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'Shang-Chi, the master of weaponry-based Kung Fu, is forced to confront his past after being drawn into the Ten Rings organization.',
                      style: textStyle),
                  const SizedBox(
                    height: 12,
                  ),
                  Text('Director',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('Destin Daniel Cretton', style: textStyle),
                  const SizedBox(
                    height: 12,
                  ),
                  Text('Writters',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text(
                      'Dave Callaham (screenplay by) . Destin Daniel Cretton (screenplay by) . Andrew Lanham(screenplay by)',
                      style: textStyle),
                  const SizedBox(
                    height: 12,
                  ),
                  Text('Stars',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                  const SizedBox(
                    height: 4,
                  ),
                  Text('Simu Liu, Awkwafina, Tony Chiu-Wai Leung',
                      style: textStyle),
                  const SizedBox(
                    height: 12,
                  ),
                  Text('Photos',
                      style: textStyle.copyWith(
                          fontWeight: FontWeight.w700, fontSize: 18)),
                ],
              ),
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                    width: 200,
                    margin:
                        EdgeInsets.only(left: index == 0 ? 30 : 0, right: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image: AssetImage('assets/images/${index + 1}.jpg'),
                            fit: BoxFit.cover)),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ]))
        ],
      ),
    );
  }
}
