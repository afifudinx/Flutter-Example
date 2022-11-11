import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/datas/sample.dart';
import 'package:flutter_instagram_clone/models/user.dart';
import 'package:flutter_instagram_clone/widgets/bottom_nav.dart';
import 'package:flutter_instagram_clone/widgets/make_post.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<User> users = [
    Sample.selena,
    Sample.bruno,
    Sample.khoa,
    Sample.zaksheuskaya,
    Sample.bward,
    Sample.angle,
  ];
  //////////////////////////////
  ///
  /// follow @withflutter
  ///
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar(),
        bottomNavigationBar: BottomNav(user: Sample.selena),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: 115,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: users.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            width: 95,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xffF7A34B),
                                      Color(0xffDE0046)
                                    ],
                                    stops: [
                                      0.4,
                                      0.7
                                    ],
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight)),
                            child: Container(
                              margin: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/${users[index].profilePic}'),
                                      fit: BoxFit.cover),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 3)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(index == 0 ? 'Your Story' : users[index].username!,
                            style: GoogleFonts.inter())
                      ],
                    );
                  },
                ),
              ),
              Divider(
                color: Colors.grey.shade300,
                thickness: 1,
                height: 1,
              ),
              MakePost(post: Sample.post1),
              MakePost(post: Sample.post2),
              MakePost(post: Sample.post3),
              MakePost(post: Sample.post4),
              MakePost(post: Sample.post5),
              MakePost(post: Sample.post6),
              MakePost(post: Sample.post7),
              MakePost(post: Sample.post8),
              MakePost(post: Sample.post9),
              MakePost(post: Sample.post10),
            ],
          ),
        ));
  }
}

PreferredSizeWidget appBar() {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    title: Padding(
      padding: const EdgeInsets.only(top: 6),
      child: Image.asset(
        'assets/images/logo.png',
        height: 36,
      ),
    ),
    actions: [
      IconButton(
          onPressed: () {}, icon: Image.asset('assets/icons/icon-add.png')),
      IconButton(
          onPressed: () {}, icon: Image.asset('assets/icons/icon-heart.png')),
      IconButton(
          onPressed: () {},
          icon: Image.asset('assets/icons/icon-messenger.png'))
    ],
  );
}
