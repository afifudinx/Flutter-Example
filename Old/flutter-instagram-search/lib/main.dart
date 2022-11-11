import 'package:flutter/material.dart';
import 'package:flutter_instasearch/models/user.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
    theme: ThemeData(fontFamily: 'Inter')));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  List<User> _users = [
    User('Christin Hume', 'christinhume', 'assets/images/christin-hume.jpg', true, true,
        true),
    User('Stefan Stefancik', 'stefan2cik', 'assets/images/stefan-stefancik.jpg', false,
        true, true),
    User('Sergio De Paula', 'paulads', 'assets/images/sergio-de-paula.jpg', false, true,
        false),
    User('Gian Cescon', 'giancescon', 'assets/images/gian-cescon.jpg', true, true, false),
    User('Mubariz Mehdizadeh', 'mubariz', 'assets/images/mubariz-mehdizadeh.jpg', false,
        false, false),
    User(
        'Jonas Kakaroto', 'jonask', 'assets/images/jonas-kakaroto.jpg', true, true, true),
    User('Jeffery Erhunse', 'jefferyerhunse', 'assets/images/jeffery-erhunse.jpg', true,
        false, false),
    User('Karl Magnuson', 'karlmagnuson', 'assets/images/karl-magnuson.jpg', false, false,
        false),
    User('Molly Blackbird', 'mollybb', 'assets/images/molly-blackbird.jpg', false, false,
        true),
    User('Ethan Hoover', 'ehoover', 'assets/images/ethan-hoover.jpg', false, false, true),
    User('Noah Silliman', 'noahsilliman', 'assets/images/noah-silliman.jpg', false, false,
        false),
    User('Drew Dizzy Graham', 'ddgraham', 'assets/images/drew-dizzy-graham.jpg', true,
        false, false),
    User('Craig Mckay', 'craigkay', 'assets/images/craig-mckay.jpg', false, false, false),
  ];

  late List<User> displayUsers;
  late TextEditingController _searchController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    displayUsers = _users;
    _searchController = TextEditingController();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 1);
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      leading: Icon(
        Icons.arrow_back,
        size: 30,
      ),
      titleSpacing: 0,
      title: Container(
        margin: EdgeInsets.only(right: 24),
        decoration: BoxDecoration(
            color: Color(0xff262626), borderRadius: BorderRadius.circular(12)),
        child: TextField(
          onChanged: (v) {
            setState(() {
              displayUsers =
                  v != '' ? _users.where((u) => u.username.contains(v)).toList() : _users;
            });
          },
          controller: _searchController,
          style: TextStyle(color: Color(0xffF7F7F7)),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
              border: InputBorder.none,
              isDense: true,
              isCollapsed: true,
              hintText: 'Search',
              hintStyle: TextStyle(color: Color(0xff8E8E8E)),
              suffixIconConstraints: BoxConstraints(
                  minWidth: 36, maxWidth: 36, minHeight: 36, maxHeight: 36),
              contentPadding: EdgeInsets.only(right: 20, left: 20, top: 10, bottom: 12),
              suffixIcon: _searchController.text.isNotEmpty
                  ? GestureDetector(
                      onTap: () {
                        setState(() {
                          _searchController.text = '';
                          displayUsers = _users;
                        });
                      },
                      child: Icon(Icons.close, color: Color(0xffF7F7F7)))
                  : null),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: appBar(),
      body: DefaultTabController(
        length: 5,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              TabBar(
                  controller: _tabController,
                  indicatorColor: Color(0xffF7F7F7),
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      child: Text(
                        'Top',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                    Tab(child: Text('Accounts', style: TextStyle(fontSize: 12))),
                    Tab(child: Text('Audio', style: TextStyle(fontSize: 12))),
                    Tab(child: Text('Tags', style: TextStyle(fontSize: 12))),
                    Tab(child: Text('Places', style: TextStyle(fontSize: 12))),
                  ]),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      child: Center(
                        child: Text('Top Result', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: displayUsers.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                          child: Row(
                            children: [
                              Container(
                                height: 64,
                                width: 64,
                                decoration: displayUsers[index].isHaveSnap
                                    ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                            colors: [Colors.pink, Colors.orange],
                                            stops: [0.4, 0.7],
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft),
                                      )
                                    : null,
                                child: Container(
                                  margin: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black, width: 2),
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                          image: AssetImage(displayUsers[index].image),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(displayUsers[index].username,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xffF7F7F7))),
                                      displayUsers[index].isVerified
                                          ? Icon(
                                              Icons.verified,
                                              color: Colors.blue,
                                              size: 14,
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                  Text(
                                    displayUsers[index].name,
                                    style: TextStyle(color: Color(0xff8E8E8E)),
                                  ),
                                  displayUsers[index].isFollowing
                                      ? Text(
                                          'Followed by withflutter + 1 more',
                                          style: TextStyle(
                                              fontSize: 12, color: Color(0xff8E8E8E)),
                                        )
                                      : SizedBox()
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                    Container(
                      child: Center(
                        child:
                            Text('Audio Result', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text('Tags Result', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    Container(
                      child: Center(
                        child:
                            Text('Places Result', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
