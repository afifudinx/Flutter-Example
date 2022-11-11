import 'package:flutter/material.dart';
import 'package:flutter_bakery_app/models/menu.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

void main() => runApp(const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  final List<List<Menu>> data = [
    [
      Menu(
          name: 'Indomie Goreng',
          image: 'indomie-goreng.jpg',
          price: '5000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
      Menu(
          name: 'Indomie Rebus',
          image: 'indomie-rebus.jpg',
          price: '5000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
      Menu(
          name: 'Indomie Dok Dok',
          image: 'indomie-dok-dok.jpg',
          price: '10000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
      Menu(
          name: 'Nasi Goreng Hongkong',
          image: 'nasi-goreng-hongkong.jpg',
          price: '15000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
      Menu(
          name: 'Nasi Goreng Tek Tek',
          image: 'nasi-goreng-tek-tek.jpg',
          price: '12000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
    ],
    [
      Menu(
          name: 'Es Jeruk',
          image: 'es-jeruk.jpg',
          price: '4000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
      Menu(
          name: 'Es Teh',
          image: 'es-teh.jpeg',
          price: '3000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
      Menu(
          name: 'Soda Gembira',
          image: 'soda-gembira.jpg',
          price: '12000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
      Menu(
          name: 'Kopi Hitam',
          image: 'kopi-hitam.jpg',
          price: '6000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
    ],
    [
      Menu(
          name: 'Roti Bakar',
          image: 'roti-bakar.jpg',
          price: '8000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
      Menu(
          name: 'Kentang Goreng',
          image: 'kentang-goreng.jpg',
          price: '8000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
      Menu(
          name: 'Pisang Goreng',
          image: 'pisang-goreng.jpg',
          price: '4000',
          desc: 'Velit aliqua officia do cupidatat labore commodo aute.'),
    ]
  ];
  final List<String> categories = ['Food', 'Drink', 'Snack'];

  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  //////////////////////////////
  /// @withflutter
  ///
  /// afifudin.vercel.app
  //////////////////////////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text('Warmindo - Surabaya',
              style: GoogleFonts.inter(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: Colors.black,
                )),
          ],
        ),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  physics: const BouncingScrollPhysics(),
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  tabs: const [
                    Tab(
                      text: 'Food',
                    ),
                    Tab(
                      text: 'Snack',
                    ),
                    Tab(
                      text: 'Drink',
                    ),
                  ],
                  onTap: (index) {
                    VerticalScrollableTabBarStatus.setIndex(index);
                  },
                ),
                Expanded(
                    child: VerticalScrollableTabView(
                        physics: const BouncingScrollPhysics(),
                        tabController: _tabController,
                        listItemData: data,
                        verticalScrollPosition: VerticalScrollPosition.middle,
                        scrollDirection: Axis.vertical,
                        eachItemChild: (items, index) => Container(
                              padding: const EdgeInsets.only(
                                  top: 24, left: 24, right: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(categories[index],
                                      style: GoogleFonts.inter(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w700)),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: data[index].map((item) {
                                        return Column(
                                          children: [
                                            Row(
                                              children: [
                                                Flexible(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(item.name!,
                                                          style:
                                                              GoogleFonts.inter(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          )),
                                                      Text(
                                                        item.desc!,
                                                        style:
                                                            GoogleFonts.inter(
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                color: Colors
                                                                    .grey),
                                                      ),
                                                      Text('Rp ${item.price}',
                                                          style:
                                                              GoogleFonts.inter(
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)),
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 24,
                                                ),
                                                Container(
                                                  height: 72,
                                                  width: 72,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12),
                                                      image: DecorationImage(
                                                          image: AssetImage(
                                                              'assets/images/${item.image}'),
                                                          fit: BoxFit.cover)),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 24,
                                            ),
                                          ],
                                        );
                                      }).toList()),
                                ],
                              ),
                            )))
              ],
            )));
  }
}
