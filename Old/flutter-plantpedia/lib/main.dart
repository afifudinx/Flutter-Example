import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<String> categories = [
    'Type',
    'Magnolia',
    'Moss',
    'Daffodil',
    'Green Algae'
  ];

  Widget card({String? name, String? family, String? image, String? desc}) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12))),
            builder: (context) {
              return Container(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name!,
                          style: GoogleFonts.merriweather(
                              color: Colors.teal.shade800, fontSize: 30)),
                      Text(
                        family!,
                        style: GoogleFonts.inter(
                            fontStyle: FontStyle.italic, fontSize: 18),
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(desc!,
                          style:
                              GoogleFonts.inter(fontWeight: FontWeight.w500)),
                    ],
                  ));
            });
      },
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            children: [
              Container(
                  height: 400,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                          image: AssetImage(image!), fit: BoxFit.cover)),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      padding: EdgeInsets.all(24),
                      width: 200,
                      height: 96,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.teal.shade800),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(name!,
                              style: GoogleFonts.merriweather(
                                  color: Colors.white, fontSize: 16)),
                          Text(
                            family!,
                            style: GoogleFonts.inter(
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                    ),
                  ))
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 48),
            width: double.infinity,
            child: Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Text('Plant Pedia',
                        style: GoogleFonts.merriweather(
                            fontSize: 30,
                            color: Colors.teal.shade800,
                            fontWeight: FontWeight.w700)),
                    Spacer(),
                    Icon(Icons.apps, color: Colors.teal.shade800),
                    SizedBox(
                      width: 24,
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 48,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: EdgeInsets.symmetric(horizontal: 24),
                        decoration: BoxDecoration(
                            color: index == 0
                                ? Colors.teal.shade800
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16)),
                        margin: EdgeInsets.only(
                            left: index == 0 ? 24 : 0, right: 12),
                        child: Center(
                            child: Text(categories[index],
                                style: GoogleFonts.inter(
                                    fontSize: 16,
                                    color: index == 0
                                        ? Colors.white
                                        : Colors.black,
                                    fontWeight: FontWeight.w500))),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                card(
                    name: 'Magnolia',
                    family: 'Magnoliaceae',
                    image: 'assets/images/magnolia.jpg',
                    desc:
                        'Magnolia is a large genus of about 210 flowering plant species in the subfamily Magnolioideae of the family Magnoliaceae. It is named after French botanist Pierre Magnol. Magnolia is an ancient genus. Appearing before bees evolved, the flowers are theorized to have evolved to encourage pollination by beetles'),
                card(
                    name: 'Moss',
                    family: 'Bryophytes',
                    image: 'assets/images/moss.jpg',
                    desc:
                        'Mosses are small, non-vascular flowerless plants in the taxonomic division Bryophyta sensu stricto. Bryophyta may also refer to the parent group bryophytes, which comprise liverworts, mosses, and hornworts. Mosses typically form dense green clumps or mats, often in damp or shady locations.'),
                card(
                    name: 'Daffodil',
                    family: 'Amaryllidaceae',
                    image: 'assets/images/daffodil.jpg',
                    desc:
                        'Narcissus is a genus of predominantly spring flowering perennial plants of the amaryllis family, Amaryllidaceae. Various common names including daffodil, narcissus and jonquil are used to describe all or some members of the genus.'),
                card(
                    name: 'Green Algae',
                    family: 'Graphidaceae',
                    image: 'assets/images/green-algae.jpg',
                    desc:
                        'The green algae are a large, informal grouping of algae consisting of the Chlorophyta and Charophyta/Streptophyta, which are now placed in separate divisions, together with the more basal Mesostigmatophyceae, Chlorokybophyceae and Spirotaenia.'),
              ],
            ),
          ),
        ));
  }
}
