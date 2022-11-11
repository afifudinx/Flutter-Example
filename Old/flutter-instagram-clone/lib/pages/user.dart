import 'package:flutter/material.dart';
import 'package:flutter_instagram_clone/datas/sample.dart';
import 'package:flutter_instagram_clone/models/post.dart';
import 'package:flutter_instagram_clone/models/user.dart';
import 'package:flutter_instagram_clone/widgets/bottom_nav.dart';
import 'package:google_fonts/google_fonts.dart';

class UserPage extends StatefulWidget {
  final User? user;
  const UserPage({Key? key, this.user}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<Post> posts = [
    Sample.post1,
    Sample.post2,
    Sample.post3,
    Sample.post4,
    Sample.post5,
    Sample.post6,
    Sample.post7,
    Sample.post8,
    Sample.post9,
    Sample.post10,
  ];
  //////////////////////////////
  ///
  /// follow @withflutter
  ///
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar() {
      return AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          title: Text('${widget.user!.username}',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w700, color: Colors.black)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz, color: Colors.black))
          ]);
    }

    Widget hero() {
      return SliverList(
          delegate: SliverChildListDelegate([
        Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 100,
                      height: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                              colors: [Color(0xffF7A34B), Color(0xffDE0046)],
                              stops: [0.4, 0.7],
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight)),
                      child: Container(
                        margin: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/${widget.user!.profilePic}'),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 3)),
                      )),
                  Column(
                    children: [
                      Text('12',
                          style:
                              GoogleFonts.inter(fontWeight: FontWeight.w700)),
                      Text('Posts',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    children: [
                      Text('107K',
                          style:
                              GoogleFonts.inter(fontWeight: FontWeight.w700)),
                      Text('Followers',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500))
                    ],
                  ),
                  Column(
                    children: [
                      Text('209',
                          style:
                              GoogleFonts.inter(fontWeight: FontWeight.w700)),
                      Text('Following',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w500))
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Text('${widget.user!.name}',
                  style: GoogleFonts.inter(fontWeight: FontWeight.w700)),
              const SizedBox(
                height: 4,
              ),
              Text('${widget.user!.bioDesc}', style: GoogleFonts.inter()),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                          child: Text('Follow',
                              style: GoogleFonts.inter(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        )),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                          child: Text('Message',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600)),
                        )),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(4)),
                        child: Center(
                          child: Text('Email',
                              style: GoogleFonts.inter(
                                  fontWeight: FontWeight.w600)),
                        )),
                  ),
                ],
              )
            ],
          ),
        )
      ]));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      bottomNavigationBar: BottomNav(user: Sample.selena),
      body: DefaultTabController(
          length: 4,
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, index) {
              return [hero()];
            },
            body: Column(
              children: [
                TabBar(indicatorColor: Colors.black, tabs: [
                  Tab(
                    icon: Image.asset('assets/icons/icon-grid.png'),
                  ),
                  Tab(
                    icon: Image.asset('assets/icons/icon-reels2.png'),
                  ),
                  Tab(
                    icon: Image.asset('assets/icons/icon-igtv.png'),
                  ),
                  Tab(
                    icon: Image.asset('assets/icons/icon-mention.png'),
                  ),
                ]),
                Expanded(
                  child: TabBarView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: posts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 1,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                          ),
                          itemBuilder: (context, index) {
                            return contentGrid(posts[index]);
                          }),
                      Container(),
                      Container(),
                      Container(),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

Widget contentGrid(Post post) {
  return Container(
    decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/posts/${post.image}'),
            fit: BoxFit.cover)),
  );
}
