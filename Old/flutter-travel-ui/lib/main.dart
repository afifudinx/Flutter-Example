import 'package:flutter/material.dart';

void main() =>
    runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, String>> bannerImages = [
    {
      'title': 'Most Visited',
      'image': 'most-visited.jpg',
    },
    {
      'title': 'Top Rated',
      'image': 'top-rated.jpg',
    },
    {
      'title': 'Hidden Gems',
      'image': 'hidden-gems.jpg',
    },
  ];
  final List<Map<String, String>> places = [
    {
      'title': 'Bali Island',
      'image': 'bali.jpg',
    },
    {
      'title': 'Merapi Mountain',
      'image': 'merapi-mountain.jpg',
    },
    {
      'title': 'Raja Ampat',
      'image': 'raja-ampat.jpg',
    },
  ];

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      physics: const BouncingScrollPhysics(),
      headerSliverBuilder: (context, innerBoxIsScrolled) => [hero()],
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 30),
        physics: const BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: 140,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: bannerImages.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: index == 0 ? 24 : 0,
                      right: index == bannerImages.length - 1 ? 24 : 8),
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "assets/images/${bannerImages[index]['image']}"))),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: Colors.black.withOpacity(0.3),
                    ),
                    child: Center(
                      child: Text(
                        bannerImages[index]['title']!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Not sure where to go? try this',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  'we will help you to find a very pleasant\ntravel experience',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey),
                )
              ],
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: places.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(
                      left: index == 0 ? 24 : 0,
                      right: index == places.length - 1 ? 24 : 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      "assets/images/${places[index]['image']}"))),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(places[index]['title']!,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ))
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}

Widget hero() {
  return SliverList(
    delegate: SliverChildListDelegate([
      Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(6)),
            gradient: LinearGradient(
                colors: [Colors.deepOrange, Colors.yellow],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
        child: SafeArea(
          top: true,
          bottom: false,
          right: false,
          left: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'How can we help \nyou, Humeyra?',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                padding: const EdgeInsets.all(4),
                child: TextField(
                  style: const TextStyle(fontWeight: FontWeight.w500),
                  textAlignVertical: TextAlignVertical.center,
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                      hintText: 'Try Pandawa Beach',
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      suffixIcon: const Icon(
                        Icons.mic,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400)),
                ),
              )
            ],
          ),
        ),
      )
    ]),
  );
}
