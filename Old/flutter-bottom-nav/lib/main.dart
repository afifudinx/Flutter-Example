import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late PersistentTabController _controller;

  List<Widget> _buildScreens() {
    return [
      MainScreen(),
      SearchScreen(),
      AddScreen(),
      MessageScreen(),
      SettingScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.home),
          title: 'Home',
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
          activeColorPrimary: Colors.red,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.search),
          title: 'Search',
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
          activeColorPrimary: Colors.green,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.add),
          title: 'Add',
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
          activeColorPrimary: Colors.blue,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.message),
          title: 'Message',
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
          activeColorPrimary: Colors.purple,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
      PersistentBottomNavBarItem(
          icon: const Icon(Icons.settings),
          title: 'Settings',
          textStyle: GoogleFonts.inter(fontWeight: FontWeight.w500),
          activeColorPrimary: Colors.orange,
          inactiveColorPrimary: Colors.grey,
          activeColorSecondary: Colors.white),
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return PersistentTabView(context,
        backgroundColor: Colors.white,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: const ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style10);
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.home,
            size: 200,
            color: Colors.white,
          ),
          Text('Hello From Home',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white))
        ],
      ),
    );
  }
}

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.search,
            size: 200,
            color: Colors.white,
          ),
          Text('Searching Page',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white))
        ],
      ),
    );
  }
}

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.add,
            size: 200,
            color: Colors.white,
          ),
          Text('Add Page',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white))
        ],
      ),
    );
  }
}

class MessageScreen extends StatefulWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  _MessageScreenState createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.message,
            size: 200,
            color: Colors.white,
          ),
          Text('Message in here',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white))
        ],
      ),
    );
  }
}

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.settings,
            size: 200,
            color: Colors.white,
          ),
          Text('This is Settings',
              style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Colors.white))
        ],
      ),
    );
  }
}
